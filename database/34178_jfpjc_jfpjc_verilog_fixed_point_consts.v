// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License



// all of these constants are positive; they are rounded and multiplied by 128 to match the 7q8 format.

// k * cos((n * pi) / 16) for 1c3 = 0.8314696123 * 0.35355339059
// 75.2560385539
// 1204.09661686
`define _1C3_COS_7Q8 (16'd75)
`define _1C3_COS_3Q12 (16'd1204)

// k * sin((n * pi) / 16) for 1c3 = 0.5555702330 * 0.35355339059
// 50.2844773345
// 804.5516373525558
`define _1C3_SIN_7Q8 (16'd50)
`define _1C3_SIN_3Q12 (16'd805)

// k * cos((n * pi) / 16) for 1c1 = 0.9807852804 * 0.35355339059
// 88.7705500995
// 1420.3288015920493
`define _1C1_COS_7Q8 (16'd89)
`define _1C1_COS_3Q12 (16'd1420)

// k * sin((n * pi) / 16) for 1c1 = 0.1950903220 * 0.35355339059
// 17.6575602725
// 282.5209643597614
`define _1C1_SIN_7Q8 (16'd18)
`define _1C1_SIN_3Q12 (16'd283)

// k * cos((n * pi) / 16) for sqrt(2)c1 = 0.54119610014 * 0.35355339059
// 48.9834793417
// 783.7356694674726
`define _R2C1_COS_7Q8 (16'd49)
`define _R2C1_COS_3Q12 (16'd784)

// k * sin((n * pi) / 16) for sqrt(2)c1 = 1.30656296488 * 0.35355339059
// 118.256580161
// 1892.1052825708425
`define _R2C1_SIN_7Q8 (16'd118)
`define _R2C1_SIN_3Q12 (16'd1892)

// 1.41421356237
// 362.038671967
// 5792.61875146752
`define _SQRT2_7Q8 (16'd362)
`define _SQRT2_3Q12 (16'd5793)

// 1.41421356237 * 0.25
// 90.5096679917
// 1448.15468786688
`define _SQRT2_OVER4_7Q8 (16'd90)
`define _SQRT2_OVER4_3Q12 (16'd1448)
