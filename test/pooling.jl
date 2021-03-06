using NNlib, Test

maxpool_answer_dict = Dict(
    1 => Dict(
        "y"          => [2, 4.],
        "y_nostride" => [2, 3, 4, 5.],
        "y_pad"      => [1, 3, 5.],

        "dx"          => [0, 2, 0, 4, 0.],
        "dx_nostride" => [0, 2, 3, 4, 5.],
        "dx_pad"      => [1, 0, 3, 0, 5.],
    ),
    2 => Dict(
        "y" => [
            7 17.;
            9 19.
        ],
        "y_nostride" => [
            7  12 17;
            8  13 18;
            9  14 19;
            10 15 20.
        ],
        "y_pad" => [
            1  11 16;
            3  13 18;
            5  15 20.
        ],

        "dx" => [
            0 0 0  0;
            0 7 0 17;
            0 0 0  0;
            0 9 0 19;
            0 0 0  0.
        ],
        "dx_nostride" => [
            0  0  0  0;
            0  7 12 17;
            0  8 13 18;
            0  9 14 19;
            0 10 15 20.
        ],
        "dx_pad"      => [
            1 0 11 16;
            0 0  0  0;
            3 0 13 18;
            0 0  0  0;
            5 0 15 20.
        ],
    ),
    3 => Dict(
        "y" => reshape([
            27, 29,
            37, 39.
        ], (2, 2, 1)),
        "y_nostride" => reshape([
            27, 28, 29, 30,
            32, 33, 34, 35,
            37, 38, 39, 40,

            47, 48, 49, 50,
            52, 53, 54, 55,
            57, 58, 59, 60.
        ], (4, 3, 2)),
        "y_pad" => reshape([
             1,  3, 5,
            11, 13, 15,
            16, 18, 20,

            41, 43, 45,
            51, 53, 55,
            56, 58, 60.
        ], (3, 3, 2)),

        "dx" => reshape([
            0, 0, 0, 0, 0,
            0, 0, 0, 0, 0,
            0, 0, 0, 0, 0,
            0, 0, 0, 0, 0,

            0,  0, 0,  0, 0,
            0, 27, 0, 29, 0,
            0,  0, 0,  0, 0,
            0, 37, 0, 39, 0,

            0, 0, 0, 0, 0,
            0, 0, 0, 0, 0,
            0, 0, 0, 0, 0,
            0, 0, 0, 0, 0.
        ], (5, 4, 3)),
        "dx_nostride" => reshape([
            0, 0, 0, 0, 0,
            0, 0, 0, 0, 0,
            0, 0, 0, 0, 0,
            0, 0, 0, 0, 0,

            0,  0,  0,  0,  0,
            0, 27, 28, 29, 30,
            0, 32, 33, 34, 35,
            0, 37, 38, 39, 40,

            0,  0,  0,  0,  0,
            0, 47, 48, 49, 50,
            0, 52, 53, 54, 55,
            0, 57, 58, 59, 60.
        ], (5, 4, 3)),
        "dx_pad" => reshape([
             1, 0,  3, 0,  5,
             0, 0,  0, 0,  0,
            11, 0, 13, 0, 15,
            16, 0, 18, 0, 20,

            0, 0, 0, 0, 0,
            0, 0, 0, 0, 0,
            0, 0, 0, 0, 0,
            0, 0, 0, 0, 0,

            41, 0, 43, 0, 45,
             0, 0,  0, 0,  0,
            51, 0, 53, 0, 55,
            56, 0, 58, 0, 60.
        ], (5, 4, 3)),
    )
)

meanpool_answer_dict = Dict(
    1 => Dict(
        "y"          => [1.5, 3.5],
        "y_nostride" => [1.5, 2.5, 3.5, 4.5],
        "y_pad"      => [0.5, 2.5, 4.5],

        "dx"          => [0.75, 0.75, 1.75, 1.75,  0.0],
        "dx_nostride" => [0.75,  2.0,  3.0,  4.0, 2.25],
        "dx_pad"      => [0.25, 1.25, 1.25, 2.25, 2.25],
    ),
    2 => Dict(
        "y" => [
            4.0 14.0;
            6.0 16.0
        ],
        "y_nostride" => [
            4.0  9.0 14.0
            5.0 10.0 15.0
            6.0 11.0 16.0
            7.0 12.0 17.0
        ],
        "y_pad" => [
            0.25  4.25 4.0
            1.25 10.0  8.75
            2.25 12.0  9.75
        ],

        "dx" => [
            1.0 1.0 3.5 3.5;
            1.0 1.0 3.5 3.5;
            1.5 1.5 4.0 4.0;
            1.5 1.5 4.0 4.0;
            0.0 0.0 0.0 0.0
        ],
        "dx_nostride" => [
            1.0  3.25  5.75 3.5;
            2.25 7.0  12.0  7.25;
            2.75 8.0  13.0  7.75;
            3.25 9.0  14.0  8.25;
            1.75 4.75  7.25 4.25
        ],
        "dx_pad"      => [
            0.0625 1.0625 1.0625 1.0;
            0.3125 2.5    2.5    2.1875;
            0.3125 2.5    2.5    2.1875;
            0.5625 3.0    3.0    2.4375;
            0.5625 3.0    3.0    2.4375
        ],
    ),
    3 => Dict(
        "y" => reshape([
            14.0, 16.0,
            24.0, 26.0
        ], (2, 2, 1)),
        "y_nostride" => reshape([
            14.0, 15.0, 16.0, 17.0,
            19.0, 20.0, 21.0, 22.0,
            24.0, 25.0, 26.0, 27.0,

            34.0, 35.0, 36.0, 37.0,
            39.0, 40.0, 41.0, 42.0,
            44.0, 45.0, 46.0, 47.0
        ], (4, 3, 2)),
        "y_pad" => reshape([
            0.125, 0.625, 1.125,
            2.125, 5.0,   6.0,
            2.0,   4.375, 4.875,

             7.75, 16.25, 17.25,
            19.25, 40.0,  42.0,
            11.5,  23.75, 24.75,
        ], (3, 3, 2)),

        "dx" => reshape([
            1.75, 1.75, 2.0, 2.0, 0.0,
            1.75, 1.75, 2.0, 2.0, 0.0,
            3.0, 3.0, 3.25, 3.25, 0.0,
            3.0, 3.0, 3.25, 3.25, 0.0,

            1.75, 1.75, 2.0, 2.0, 0.0,
            1.75, 1.75, 2.0, 2.0, 0.0,
            3.0, 3.0, 3.25, 3.25, 0.0,
            3.0, 3.0, 3.25, 3.25, 0.0,

            0.0, 0.0, 0.0, 0.0, 0.0,
            0.0, 0.0, 0.0, 0.0, 0.0,
            0.0, 0.0, 0.0, 0.0, 0.0,
            0.0, 0.0, 0.0, 0.0, 0.0,
        ], (5, 4, 3)),
        "dx_nostride" => reshape([
            1.75,   3.625,  3.875,  4.125, 2.125,
            4.125,  8.5,    9.0,    9.5,   4.875,
            5.375, 11.0,   11.5,   12.0,   6.125,
            3.0,    6.125,  6.375,  6.625, 3.375,

             6.0,  12.25, 12.75, 13.25,  6.75,
            13.25, 27.0,  28.0,  29.0,  14.75,
            15.75, 32.0,  33.0,  34.0,  17.25,
             8.5,  17.25, 17.75, 18.25,  9.25,

             4.25,   8.625,  8.875,  9.125,  4.625,
             9.125, 18.5,   19.0,   19.5,    9.875,
            10.375, 21.0,   21.5,   22.0,   11.125,
             5.5,   11.125, 11.375, 11.625,  5.875
        ], (5, 4, 3)),
        "dx_pad" => reshape([
            0.015625, 0.078125, 0.078125, 0.140625, 0.140625,
            0.265625, 0.625,    0.625,    0.75,     0.75,
            0.265625, 0.625,    0.625,    0.75,     0.75,
            0.25,     0.546875, 0.546875, 0.609375, 0.609375,

            0.96875, 2.03125, 2.03125, 2.15625, 2.15625,
            2.40625, 5.0,     5.0,     5.25,    5.25,
            2.40625, 5.0,     5.0,     5.25,    5.25,
            1.4375,  2.96875, 2.96875, 3.09375, 3.09375,

            0.96875, 2.03125, 2.03125, 2.15625, 2.15625,
            2.40625, 5.0,     5.0,     5.25,    5.25,
            2.40625, 5.0,     5.0,     5.25,    5.25,
            1.4375,  2.96875, 2.96875, 3.09375, 3.09375
        ], (5, 4, 3)),
    )
)

for rank in (1, 2, 3)
    @testset "pool$(rank)d" begin
        for (pool, ∇pool, answer_dict) in (
                # Main API name
                (maxpool, ∇maxpool, maxpool_answer_dict),
                (meanpool, ∇meanpool, meanpool_answer_dict),

                # _direct name
                (NNlib.maxpool_direct, NNlib.∇maxpool_direct, maxpool_answer_dict),
                (NNlib.meanpool_direct, NNlib.∇meanpool_direct, meanpool_answer_dict),
            )

            @testset "$(pool)$(rank)d" begin
                y = answer_dict[rank]["y"]
                y_nostride = answer_dict[rank]["y_nostride"]
                y_pad = answer_dict[rank]["y_pad"]
                dx = answer_dict[rank]["dx"]
                dx_nostride = answer_dict[rank]["dx_nostride"]
                dx_pad = answer_dict[rank]["dx_pad"]

                x = reshape(Float64[1:prod(size(dx));], size(dx)..., 1, 1)

                # A "drop channels and batch dimension" helper
                ddims(x) = dropdims(x, dims=(rank+1, rank+2))

                # Let's ensure that a 1x1x1 pooling kernel always just returns `x`
                @test pool(x, PoolDims(x, 1)) == x

                # Test vanilla pooling
                pdims = PoolDims(x, 2)
                y_hat = pool(x, pdims)
                @test ddims(y_hat) == y
                @test ddims(∇pool(y_hat, y_hat, x, pdims)) == dx

                # Strided pooling
                pdims = PoolDims(x, 2; stride=1)
                y_hat = pool(x, pdims)
                @test ddims(y_hat) == y_nostride
                @test ddims(∇pool(y_hat, y_hat, x, pdims)) == dx_nostride

                # Padded pooling
                pdims = PoolDims(x, 2; padding=1)
                y_hat = pool(x, pdims)
                @test ddims(y_hat) == y_pad
                @test ddims(∇pool(y_hat, y_hat, x, pdims)) == dx_pad
            end
        end
    end
end

x = rand(10, 10, 3, 10)
@test size(maxpool(x, (2, 2))) == (5, 5, 3, 10)
@test size(maxpool(x, (2, 2); pad = (2, 2), stride = (2, 2))) == (7, 7, 3, 10)
@test size(meanpool(x, (2, 2))) == (5, 5, 3, 10)
@test size(meanpool(x, (2, 2); pad = (2, 2), stride = (2, 2))) == (7, 7, 3, 10)

# Add another test for 2d maxpool that uses an odd-length size:
@testset "Issue #133" begin
    x = reshape([(1.:9.)...], 3, 3, 1, 1)
    pdims = PoolDims(size(x), (2,2), padding = (1,1), stride = (2,2))
    y = maxpool(x, pdims)

    dy = y .* 0 .+ 1
    dx = ∇maxpool(dy, y, x, pdims)
    @test dx[:,:,1,1] == [1.0 0.0 1.0; 0.0 0.0 0.0; 1.0 0.0 1.0]
end
