// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps

module gaussian_tb;
// ******************************************************************
// PARAMETERS
// ******************************************************************
    parameter integer dataLen           = 16;
    parameter integer fracLen           = 7;
	parameter integer indexLen          = 9;
    parameter integer input_range       = 16;
    parameter integer interval_entries  = 32;
    parameter integer interval_bits     = 5;
    parameter integer table_size        = input_range * interval_entries;
// ******************************************************************


// ******************************************************************
// Wires and Regs
// ******************************************************************
    reg                                 clk;
    reg                                 reset;
    reg                                 fail_flag;
    reg signed [dataLen - 1 : 0]        in;
	wire [dataLen - 1 : 0]              out;
    
// ******************************************************************


// ******************************************************************
// Modules Initialization
// ******************************************************************
	gaussian #(
		.dataLen    (dataLen)
	) gaussian_uint (
		.in         (in),
	  	.out        (out)
	);
// ******************************************************************


//--------------------------------------------------------------------------------------
function signed [dataLen-1 :0] expected_data_function;

    input signed [dataLen-1 :0] in;
	reg [indexLen - 1 :0] index;

    begin
        expected_data_function = 0;
        if (in < (-((input_range/2) << fracLen))) begin
            expected_data_function = 0;
        end else if (in > ((input_range/2) << fracLen)) begin
            expected_data_function = 0;
        end else begin
            index = in >> (fracLen - interval_bits);
            //$display("Input: %d, Index: %d", in, index);
		case(index)
			9'd256: expected_data_function = 16'b0000000000000000; // input=-8.0, output=2.05232614558e-56
			9'd257: expected_data_function = 16'b0000000000000000; // input=-7.96875, output=5.56791540596e-56
			9'd258: expected_data_function = 16'b0000000000000000; // input=-7.9375, output=1.50467399787e-55
			9'd259: expected_data_function = 16'b0000000000000000; // input=-7.90625, output=4.05037972923e-55
			9'd260: expected_data_function = 16'b0000000000000000; // input=-7.875, output=1.0860569595e-54
			9'd261: expected_data_function = 16'b0000000000000000; // input=-7.84375, output=2.90076804211e-54
			9'd262: expected_data_function = 16'b0000000000000000; // input=-7.8125, output=7.71750533773e-54
			9'd263: expected_data_function = 16'b0000000000000000; // input=-7.78125, output=2.04524063202e-53
			9'd264: expected_data_function = 16'b0000000000000000; // input=-7.75, output=5.39902604918e-53
			9'd265: expected_data_function = 16'b0000000000000000; // input=-7.71875, output=1.41967838716e-52
			9'd266: expected_data_function = 16'b0000000000000000; // input=-7.6875, output=3.71850231248e-52
			9'd267: expected_data_function = 16'b0000000000000000; // input=-7.65625, output=9.70174103983e-52
			9'd268: expected_data_function = 16'b0000000000000000; // input=-7.625, output=2.52135987788e-51
			9'd269: expected_data_function = 16'b0000000000000000; // input=-7.59375, output=6.52714911362e-51
			9'd270: expected_data_function = 16'b0000000000000000; // input=-7.5625, output=1.68312266462e-50
			9'd271: expected_data_function = 16'b0000000000000000; // input=-7.53125, output=4.32326183636e-50
			9'd272: expected_data_function = 16'b0000000000000000; // input=-7.5, output=1.10614190997e-49
			9'd273: expected_data_function = 16'b0000000000000000; // input=-7.46875, output=2.81912084447e-49
			9'd274: expected_data_function = 16'b0000000000000000; // input=-7.4375, output=7.15681968385e-49
			9'd275: expected_data_function = 16'b0000000000000000; // input=-7.40625, output=1.80979754616e-48
			9'd276: expected_data_function = 16'b0000000000000000; // input=-7.375, output=4.55872560131e-48
			9'd277: expected_data_function = 16'b0000000000000000; // input=-7.34375, output=1.14382726918e-47
			9'd278: expected_data_function = 16'b0000000000000000; // input=-7.3125, output=2.85878159428e-47
			9'd279: expected_data_function = 16'b0000000000000000; // input=-7.28125, output=7.1171324113e-47
			9'd280: expected_data_function = 16'b0000000000000000; // input=-7.25, output=1.76495099492e-46
			9'd281: expected_data_function = 16'b0000000000000000; // input=-7.21875, output=4.35977216421e-46
			9'd282: expected_data_function = 16'b0000000000000000; // input=-7.1875, output=1.07274987899e-45
			9'd283: expected_data_function = 16'b0000000000000000; // input=-7.15625, output=2.62927911298e-45
			9'd284: expected_data_function = 16'b0000000000000000; // input=-7.125, output=6.41916362084e-45
			9'd285: expected_data_function = 16'b0000000000000000; // input=-7.09375, output=1.56107488696e-44
			9'd286: expected_data_function = 16'b0000000000000000; // input=-7.0625, output=3.78157367485e-44
			9'd287: expected_data_function = 16'b0000000000000000; // input=-7.03125, output=9.12483314748e-44
			9'd288: expected_data_function = 16'b0000000000000000; // input=-7.0, output=2.19321311878e-43
			9'd289: expected_data_function = 16'b0000000000000000; // input=-6.96875, output=5.25097892486e-43
			9'd290: expected_data_function = 16'b0000000000000000; // input=-6.9375, output=1.25228521358e-42
			9'd291: expected_data_function = 16'b0000000000000000; // input=-6.90625, output=2.97488215993e-42
			9'd292: expected_data_function = 16'b0000000000000000; // input=-6.875, output=7.03946767599e-42
			9'd293: expected_data_function = 16'b0000000000000000; // input=-6.84375, output=1.65925604311e-41
			9'd294: expected_data_function = 16'b0000000000000000; // input=-6.8125, output=3.89574510993e-41
			9'd295: expected_data_function = 16'b0000000000000000; // input=-6.78125, output=9.11110806056e-41
			9'd296: expected_data_function = 16'b0000000000000000; // input=-6.75, output=2.12253762783e-40
			9'd297: expected_data_function = 16'b0000000000000000; // input=-6.71875, output=4.92541848268e-40
			9'd298: expected_data_function = 16'b0000000000000000; // input=-6.6875, output=1.13850360632e-39
			9'd299: expected_data_function = 16'b0000000000000000; // input=-6.65625, output=2.62137541904e-39
			9'd300: expected_data_function = 16'b0000000000000000; // input=-6.625, output=6.0121190522e-39
			9'd301: expected_data_function = 16'b0000000000000000; // input=-6.59375, output=1.37350251292e-38
			9'd302: expected_data_function = 16'b0000000000000000; // input=-6.5625, output=3.12561067823e-38
			9'd303: expected_data_function = 16'b0000000000000000; // input=-6.53125, output=7.08506506176e-38
			9'd304: expected_data_function = 16'b0000000000000000; // input=-6.5, output=1.5997655514e-37
			9'd305: expected_data_function = 16'b0000000000000000; // input=-6.46875, output=3.59809292893e-37
			9'd306: expected_data_function = 16'b0000000000000000; // input=-6.4375, output=8.06105618402e-37
			9'd307: expected_data_function = 16'b0000000000000000; // input=-6.40625, output=1.79893328563e-36
			9'd308: expected_data_function = 16'b0000000000000000; // input=-6.375, output=3.99891068444e-36
			9'd309: expected_data_function = 16'b0000000000000000; // input=-6.34375, output=8.85465996484e-36
			9'd310: expected_data_function = 16'b0000000000000000; // input=-6.3125, output=1.9530151363e-35
			9'd311: expected_data_function = 16'b0000000000000000; // input=-6.28125, output=4.29084540294e-35
			9'd312: expected_data_function = 16'b0000000000000000; // input=-6.25, output=9.39039071595e-35
			9'd313: expected_data_function = 16'b0000000000000000; // input=-6.21875, output=2.04704785425e-34
			9'd314: expected_data_function = 16'b0000000000000000; // input=-6.1875, output=4.44504196183e-34
			9'd315: expected_data_function = 16'b0000000000000000; // input=-6.15625, output=9.61451258101e-34
			9'd316: expected_data_function = 16'b0000000000000000; // input=-6.125, output=2.07148701924e-33
			9'd317: expected_data_function = 16'b0000000000000000; // input=-6.09375, output=4.44570557614e-33
			9'd318: expected_data_function = 16'b0000000000000000; // input=-6.0625, output=9.50391877478e-33
			9'd319: expected_data_function = 16'b0000000000000000; // input=-6.03125, output=2.02380316897e-32
			9'd320: expected_data_function = 16'b0000000000000000; // input=-6.0, output=4.29276747133e-32
			9'd321: expected_data_function = 16'b0000000000000000; // input=-5.96875, output=9.0700565429e-32
			9'd322: expected_data_function = 16'b0000000000000000; // input=-5.9375, output=1.90891311466e-31
			9'd323: expected_data_function = 16'b0000000000000000; // input=-5.90625, output=4.00189662571e-31
			9'd324: expected_data_function = 16'b0000000000000000; // input=-5.875, output=8.35697508909e-31
			9'd325: expected_data_function = 16'b0000000000000000; // input=-5.84375, output=1.73834465408e-30
			9'd326: expected_data_function = 16'b0000000000000000; // input=-5.8125, output=3.60185480783e-30
			9'd327: expected_data_function = 16'b0000000000000000; // input=-5.78125, output=7.43395718253e-30
			9'd328: expected_data_function = 16'b0000000000000000; // input=-5.75, output=1.52833108232e-29
			9'd329: expected_data_function = 16'b0000000000000000; // input=-5.71875, output=3.12981287739e-29
			9'd330: expected_data_function = 16'b0000000000000000; // input=-5.6875, output=6.38444040927e-29
			9'd331: expected_data_function = 16'b0000000000000000; // input=-5.65625, output=1.29727138784e-28
			9'd332: expected_data_function = 16'b0000000000000000; // input=-5.625, output=2.62568352123e-28
			9'd333: expected_data_function = 16'b0000000000000000; // input=-5.59375, output=5.29367719434e-28
			9'd334: expected_data_function = 16'b0000000000000000; // input=-5.5625, output=1.0631047732e-27
			9'd335: expected_data_function = 16'b0000000000000000; // input=-5.53125, output=2.12666076412e-27
			9'd336: expected_data_function = 16'b0000000000000000; // input=-5.5, output=4.23763850702e-27
			9'd337: expected_data_function = 16'b0000000000000000; // input=-5.46875, output=8.41110648574e-27
			9'd338: expected_data_function = 16'b0000000000000000; // input=-5.4375, output=1.66297566216e-26
			9'd339: expected_data_function = 16'b0000000000000000; // input=-5.40625, output=3.27508210893e-26
			9'd340: expected_data_function = 16'b0000000000000000; // input=-5.375, output=6.42483574324e-26
			9'd341: expected_data_function = 16'b0000000000000000; // input=-5.34375, output=1.25546729163e-25
			9'd342: expected_data_function = 16'b0000000000000000; // input=-5.3125, output=2.4437248966e-25
			9'd343: expected_data_function = 16'b0000000000000000; // input=-5.28125, output=4.73808405983e-25
			9'd344: expected_data_function = 16'b0000000000000000; // input=-5.25, output=9.15075118104e-25
			9'd345: expected_data_function = 16'b0000000000000000; // input=-5.21875, output=1.76041179165e-24
			9'd346: expected_data_function = 16'b0000000000000000; // input=-5.1875, output=3.37345816254e-24
			9'd347: expected_data_function = 16'b0000000000000000; // input=-5.15625, output=6.43931877481e-24
			9'd348: expected_data_function = 16'b0000000000000000; // input=-5.125, output=1.22435697305e-23
			9'd349: expected_data_function = 16'b0000000000000000; // input=-5.09375, output=2.31888776995e-23
			9'd350: expected_data_function = 16'b0000000000000000; // input=-5.0625, output=4.37476710924e-23
			9'd351: expected_data_function = 16'b0000000000000000; // input=-5.03125, output=8.22117104008e-23
			9'd352: expected_data_function = 16'b0000000000000000; // input=-5.0, output=1.53891972534e-22
			9'd353: expected_data_function = 16'b0000000000000000; // input=-4.96875, output=2.86947064418e-22
			9'd354: expected_data_function = 16'b0000000000000000; // input=-4.9375, output=5.32955738878e-22
			9'd355: expected_data_function = 16'b0000000000000000; // input=-4.90625, output=9.86016170148e-22
			9'd356: expected_data_function = 16'b0000000000000000; // input=-4.875, output=1.8171068624e-21
			9'd357: expected_data_function = 16'b0000000000000000; // input=-4.84375, output=3.33564970748e-21
			9'd358: expected_data_function = 16'b0000000000000000; // input=-4.8125, output=6.09935544127e-21
			9'd359: expected_data_function = 16'b0000000000000000; // input=-4.78125, output=1.11094097589e-20
			9'd360: expected_data_function = 16'b0000000000000000; // input=-4.75, output=2.01558707886e-20
			9'd361: expected_data_function = 16'b0000000000000000; // input=-4.71875, output=3.64263522358e-20
			9'd362: expected_data_function = 16'b0000000000000000; // input=-4.6875, output=6.55742507756e-20
			9'd363: expected_data_function = 16'b0000000000000000; // input=-4.65625, output=1.17585705385e-19
			9'd364: expected_data_function = 16'b0000000000000000; // input=-4.625, output=2.10028996599e-19
			9'd365: expected_data_function = 16'b0000000000000000; // input=-4.59375, output=3.73686598887e-19
			9'd366: expected_data_function = 16'b0000000000000000; // input=-4.5625, output=6.62276472038e-19
			9'd367: expected_data_function = 16'b0000000000000000; // input=-4.53125, output=1.1691619338e-18
			9'd368: expected_data_function = 16'b0000000000000000; // input=-4.5, output=2.05595471433e-18
			9'd369: expected_data_function = 16'b0000000000000000; // input=-4.46875, output=3.6012722876e-18
			9'd370: expected_data_function = 16'b0000000000000000; // input=-4.4375, output=6.28350421733e-18
			9'd371: expected_data_function = 16'b0000000000000000; // input=-4.40625, output=1.09207232111e-17
			9'd372: expected_data_function = 16'b0000000000000000; // input=-4.375, output=1.89062077638e-17
			9'd373: expected_data_function = 16'b0000000000000000; // input=-4.34375, output=3.26032571594e-17
			9'd374: expected_data_function = 16'b0000000000000000; // input=-4.3125, output=5.6004263471e-17
			9'd375: expected_data_function = 16'b0000000000000000; // input=-4.28125, output=9.58263017897e-17
			9'd376: expected_data_function = 16'b0000000000000000; // input=-4.25, output=1.63324712633e-16
			9'd377: expected_data_function = 16'b0000000000000000; // input=-4.21875, output=2.77282598204e-16
			9'd378: expected_data_function = 16'b0000000000000000; // input=-4.1875, output=4.68917956941e-16
			9'd379: expected_data_function = 16'b0000000000000000; // input=-4.15625, output=7.89904613881e-16
			9'd380: expected_data_function = 16'b0000000000000000; // input=-4.125, output=1.32542749119e-15
			9'd381: expected_data_function = 16'b0000000000000000; // input=-4.09375, output=2.21534227444e-15
			9'd382: expected_data_function = 16'b0000000000000000; // input=-4.0625, output=3.68832543083e-15
			9'd383: expected_data_function = 16'b0000000000000000; // input=-4.03125, output=6.11675616292e-15
			9'd384: expected_data_function = 16'b0000000000000000; // input=-4.0, output=1.01045421671e-14
			9'd385: expected_data_function = 16'b0000000000000000; // input=-3.96875, output=1.66270671268e-14
			9'd386: expected_data_function = 16'b0000000000000000; // input=-3.9375, output=2.72532435195e-14
			9'd387: expected_data_function = 16'b0000000000000000; // input=-3.90625, output=4.44963390508e-14
			9'd388: expected_data_function = 16'b0000000000000000; // input=-3.875, output=7.23658890223e-14
			9'd389: expected_data_function = 16'b0000000000000000; // input=-3.84375, output=1.17232239136e-13
			9'd390: expected_data_function = 16'b0000000000000000; // input=-3.8125, output=1.89175005616e-13
			9'd391: expected_data_function = 16'b0000000000000000; // input=-3.78125, output=3.04077291445e-13
			9'd392: expected_data_function = 16'b0000000000000000; // input=-3.75, output=4.86864106606e-13
			9'd393: expected_data_function = 16'b0000000000000000; // input=-3.71875, output=7.76488565871e-13
			9'd394: expected_data_function = 16'b0000000000000000; // input=-3.6875, output=1.23357599371e-12
			9'd395: expected_data_function = 16'b0000000000000000; // input=-3.65625, output=1.95209203954e-12
			9'd396: expected_data_function = 16'b0000000000000000; // input=-3.625, output=3.07707590112e-12
			9'd397: expected_data_function = 16'b0000000000000000; // input=-3.59375, output=4.83147419902e-12
			9'd398: expected_data_function = 16'b0000000000000000; // input=-3.5625, output=7.55656909133e-12
			9'd399: expected_data_function = 16'b0000000000000000; // input=-3.53125, output=1.17726216712e-11
			9'd400: expected_data_function = 16'b0000000000000000; // input=-3.5, output=1.82694408167e-11
			9'd401: expected_data_function = 16'b0000000000000000; // input=-3.46875, output=2.82410512722e-11
			9'd402: expected_data_function = 16'b0000000000000000; // input=-3.4375, output=4.34850527144e-11
			9'd403: expected_data_function = 16'b0000000000000000; // input=-3.40625, output=6.66964440085e-11
			9'd404: expected_data_function = 16'b0000000000000000; // input=-3.375, output=1.01898759177e-10
			9'd405: expected_data_function = 16'b0000000000000000; // input=-3.34375, output=1.55073878412e-10
			9'd406: expected_data_function = 16'b0000000000000000; // input=-3.3125, output=2.35077973981e-10
			9'd407: expected_data_function = 16'b0000000000000000; // input=-3.28125, output=3.54967642802e-10
			9'd408: expected_data_function = 16'b0000000000000000; // input=-3.25, output=5.33911322953e-10
			9'd409: expected_data_function = 16'b0000000000000000; // input=-3.21875, output=7.99931931389e-10
			9'd410: expected_data_function = 16'b0000000000000000; // input=-3.1875, output=1.19382445829e-09
			9'd411: expected_data_function = 16'b0000000000000000; // input=-3.15625, output=1.77472655813e-09
			9'd412: expected_data_function = 16'b0000000000000000; // input=-3.125, output=2.62800363631e-09
			9'd413: expected_data_function = 16'b0000000000000000; // input=-3.09375, output=3.87635918724e-09
			9'd414: expected_data_function = 16'b0000000000000000; // input=-3.0625, output=5.69541795659e-09
			9'd415: expected_data_function = 16'b0000000000000000; // input=-3.03125, output=8.33548213617e-09
			9'd416: expected_data_function = 16'b0000000000000000; // input=-3.0, output=1.21517656996e-08
			9'd417: expected_data_function = 16'b0000000000000000; // input=-2.96875, output=1.76462158208e-08
			9'd418: expected_data_function = 16'b0000000000000000; // input=-2.9375, output=2.55250924071e-08
			9'd419: expected_data_function = 16'b0000000000000000; // input=-2.90625, output=3.67778719754e-08
			9'd420: expected_data_function = 16'b0000000000000000; // input=-2.875, output=5.27848640714e-08
			9'd421: expected_data_function = 16'b0000000000000000; // input=-2.84375, output=7.54632935059e-08
			9'd422: expected_data_function = 16'b0000000000000000; // input=-2.8125, output=1.07464653011e-07
			9'd423: expected_data_function = 16'b0000000000000000; // input=-2.78125, output=1.52440043186e-07
			9'd424: expected_data_function = 16'b0000000000000000; // input=-2.75, output=2.15395200851e-07
			9'd425: expected_data_function = 16'b0000000000000000; // input=-2.71875, output=3.03163225748e-07
			9'd426: expected_data_function = 16'b0000000000000000; // input=-2.6875, output=4.25030947662e-07
			9'd427: expected_data_function = 16'b0000000000000000; // input=-2.65625, output=5.93564781242e-07
			9'd428: expected_data_function = 16'b0000000000000000; // input=-2.625, output=8.25694197726e-07
			9'd429: expected_data_function = 16'b0000000000000000; // input=-2.59375, output=1.14412606129e-06
			9'd430: expected_data_function = 16'b0000000000000000; // input=-2.5625, output=1.57918154814e-06
			9'd431: expected_data_function = 16'b0000000000000000; // input=-2.53125, output=2.17116975587e-06
			9'd432: expected_data_function = 16'b0000000000000000; // input=-2.5, output=2.97343902947e-06
			9'd433: expected_data_function = 16'b0000000000000000; // input=-2.46875, output=4.05627911931e-06
			9'd434: expected_data_function = 16'b0000000000000000; // input=-2.4375, output=5.5118851951e-06
			9'd435: expected_data_function = 16'b0000000000000000; // input=-2.40625, output=7.46063909651e-06
			9'd436: expected_data_function = 16'b0000000000000000; // input=-2.375, output=1.00590145772e-05
			9'd437: expected_data_function = 16'b0000000000000000; // input=-2.34375, output=1.35094721523e-05
			9'd438: expected_data_function = 16'b0000000000000000; // input=-2.3125, output=1.80727757781e-05
			9'd439: expected_data_function = 16'b0000000000000000; // input=-2.28125, output=2.40832380116e-05
			9'd440: expected_data_function = 16'b0000000000000000; // input=-2.25, output=3.19674822138e-05
			9'd441: expected_data_function = 16'b0000000000000000; // input=-2.21875, output=4.22673990269e-05
			9'd442: expected_data_function = 16'b0000000000000000; // input=-2.1875, output=5.56680684584e-05
			9'd443: expected_data_function = 16'b0000000000000000; // input=-2.15625, output=7.30315164609e-05
			9'd444: expected_data_function = 16'b0000000000000000; // input=-2.125, output=9.54372730824e-05
			9'd445: expected_data_function = 16'b0000000000000000; // input=-2.09375, output=0.000124230794341
			9'd446: expected_data_function = 16'b0000000000000000; // input=-2.0625, output=0.000161080897111
			9'd447: expected_data_function = 16'b0000000000000000; // input=-2.03125, output=0.000208047429535
			9'd448: expected_data_function = 16'b0000000000000000; // input=-2.0, output=0.00026766045153
			9'd449: expected_data_function = 16'b0000000000000000; // input=-1.96875, output=0.000343012222389
			9'd450: expected_data_function = 16'b0000000000000000; // input=-1.9375, output=0.000437863275529
			9'd451: expected_data_function = 16'b0000000000000000; // input=-1.90625, output=0.000556763793197
			9'd452: expected_data_function = 16'b0000000000000000; // input=-1.875, output=0.000705191364735
			9'd453: expected_data_function = 16'b0000000000000000; // input=-1.84375, output=0.000889706008226
			9'd454: expected_data_function = 16'b0000000000000000; // input=-1.8125, output=0.00111812304446
			9'd455: expected_data_function = 16'b0000000000000000; // input=-1.78125, output=0.00139970402189
			9'd456: expected_data_function = 16'b0000000000000000; // input=-1.75, output=0.00174536539009
			9'd457: expected_data_function = 16'b0000000000000000; // input=-1.71875, output=0.00216790399823
			9'd458: expected_data_function = 16'b0000000000000000; // input=-1.6875, output=0.00268223774698
			9'd459: expected_data_function = 16'b0000000000000000; // input=-1.65625, output=0.00330565884481
			9'd460: expected_data_function = 16'b0000000000000001; // input=-1.625, output=0.0040580961146
			9'd461: expected_data_function = 16'b0000000000000001; // input=-1.59375, output=0.00496238167221
			9'd462: expected_data_function = 16'b0000000000000001; // input=-1.5625, output=0.0060445160704
			9'd463: expected_data_function = 16'b0000000000000001; // input=-1.53125, output=0.00733392469259
			9'd464: expected_data_function = 16'b0000000000000001; // input=-1.5, output=0.00886369682388
			9'd465: expected_data_function = 16'b0000000000000001; // input=-1.46875, output=0.0106707974632
			9'd466: expected_data_function = 16'b0000000000000010; // input=-1.4375, output=0.0127962406214
			9'd467: expected_data_function = 16'b0000000000000010; // input=-1.40625, output=0.0152852116375
			9'd468: expected_data_function = 16'b0000000000000010; // input=-1.375, output=0.0181871250032
			9'd469: expected_data_function = 16'b0000000000000011; // input=-1.34375, output=0.0215556034005
			9'd470: expected_data_function = 16'b0000000000000011; // input=-1.3125, output=0.0254483631937
			9'd471: expected_data_function = 16'b0000000000000100; // input=-1.28125, output=0.0299269915718
			9'd472: expected_data_function = 16'b0000000000000100; // input=-1.25, output=0.0350566009871
			9'd473: expected_data_function = 16'b0000000000000101; // input=-1.21875, output=0.0409053475456
			9'd474: expected_data_function = 16'b0000000000000110; // input=-1.1875, output=0.0475438016598
			9'd475: expected_data_function = 16'b0000000000000111; // input=-1.15625, output=0.0550441616058
			9'd476: expected_data_function = 16'b0000000000001000; // input=-1.125, output=0.0634793036713
			9'd477: expected_data_function = 16'b0000000000001001; // input=-1.09375, output=0.0729216663524
			9'd478: expected_data_function = 16'b0000000000001011; // input=-1.0625, output=0.0834419705127
			9'd479: expected_data_function = 16'b0000000000001100; // input=-1.03125, output=0.0951077825213
			9'd480: expected_data_function = 16'b0000000000001110; // input=-1.0, output=0.107981933026
			9'd481: expected_data_function = 16'b0000000000010000; // input=-0.96875, output=0.122120810082
			9'd482: expected_data_function = 16'b0000000000010010; // input=-0.9375, output=0.137572551653
			9'd483: expected_data_function = 16'b0000000000010100; // input=-0.90625, output=0.154375168879
			9'd484: expected_data_function = 16'b0000000000010110; // input=-0.875, output=0.172554637653
			9'd485: expected_data_function = 16'b0000000000011001; // input=-0.84375, output=0.19212300181
			9'd486: expected_data_function = 16'b0000000000011011; // input=-0.8125, output=0.213076536261
			9'd487: expected_data_function = 16'b0000000000011110; // input=-0.78125, output=0.235394022449
			9'd488: expected_data_function = 16'b0000000000100001; // input=-0.75, output=0.259035191332
			9'd489: expected_data_function = 16'b0000000000100100; // input=-0.71875, output=0.28393939041
			9'd490: expected_data_function = 16'b0000000000101000; // input=-0.6875, output=0.310024530917
			9'd491: expected_data_function = 16'b0000000000101011; // input=-0.65625, output=0.337186369036
			9'd492: expected_data_function = 16'b0000000000101111; // input=-0.625, output=0.365298170778
			9'd493: expected_data_function = 16'b0000000000110010; // input=-0.59375, output=0.394210803837
			9'd494: expected_data_function = 16'b0000000000110110; // input=-0.5625, output=0.423753291551
			9'd495: expected_data_function = 16'b0000000000111010; // input=-0.53125, output=0.453733853938
			9'd496: expected_data_function = 16'b0000000000111110; // input=-0.5, output=0.483941449038
			9'd497: expected_data_function = 16'b0000000001000010; // input=-0.46875, output=0.514147814693
			9'd498: expected_data_function = 16'b0000000001000110; // input=-0.4375, output=0.544109996757
			9'd499: expected_data_function = 16'b0000000001001001; // input=-0.40625, output=0.573573335133
			9'd500: expected_data_function = 16'b0000000001001101; // input=-0.375, output=0.60227486431
			9'd501: expected_data_function = 16'b0000000001010001; // input=-0.34375, output=0.629947070853
			9'd502: expected_data_function = 16'b0000000001010100; // input=-0.3125, output=0.656321937101
			9'd503: expected_data_function = 16'b0000000001010111; // input=-0.28125, output=0.68113518864
			9'd504: expected_data_function = 16'b0000000001011010; // input=-0.25, output=0.704130653529
			9'd505: expected_data_function = 16'b0000000001011101; // input=-0.21875, output=0.725064634081
			9'd506: expected_data_function = 16'b0000000001011111; // input=-0.1875, output=0.74371018774
			9'd507: expected_data_function = 16'b0000000001100001; // input=-0.15625, output=0.759861212397
			9'd508: expected_data_function = 16'b0000000001100011; // input=-0.125, output=0.773336233606
			9'd509: expected_data_function = 16'b0000000001100100; // input=-0.09375, output=0.783981796505
			9'd510: expected_data_function = 16'b0000000001100101; // input=-0.0625, output=0.791675373889
			9'd511: expected_data_function = 16'b0000000001100110; // input=-0.03125, output=0.796327713374
			9'd0: expected_data_function = 16'b0000000001100110; // input=0.0, output=0.797884560803
			9'd1: expected_data_function = 16'b0000000001100110; // input=0.03125, output=0.796327713374
			9'd2: expected_data_function = 16'b0000000001100101; // input=0.0625, output=0.791675373889
			9'd3: expected_data_function = 16'b0000000001100100; // input=0.09375, output=0.783981796505
			9'd4: expected_data_function = 16'b0000000001100011; // input=0.125, output=0.773336233606
			9'd5: expected_data_function = 16'b0000000001100001; // input=0.15625, output=0.759861212397
			9'd6: expected_data_function = 16'b0000000001011111; // input=0.1875, output=0.74371018774
			9'd7: expected_data_function = 16'b0000000001011101; // input=0.21875, output=0.725064634081
			9'd8: expected_data_function = 16'b0000000001011010; // input=0.25, output=0.704130653529
			9'd9: expected_data_function = 16'b0000000001010111; // input=0.28125, output=0.68113518864
			9'd10: expected_data_function = 16'b0000000001010100; // input=0.3125, output=0.656321937101
			9'd11: expected_data_function = 16'b0000000001010001; // input=0.34375, output=0.629947070853
			9'd12: expected_data_function = 16'b0000000001001101; // input=0.375, output=0.60227486431
			9'd13: expected_data_function = 16'b0000000001001001; // input=0.40625, output=0.573573335133
			9'd14: expected_data_function = 16'b0000000001000110; // input=0.4375, output=0.544109996757
			9'd15: expected_data_function = 16'b0000000001000010; // input=0.46875, output=0.514147814693
			9'd16: expected_data_function = 16'b0000000000111110; // input=0.5, output=0.483941449038
			9'd17: expected_data_function = 16'b0000000000111010; // input=0.53125, output=0.453733853938
			9'd18: expected_data_function = 16'b0000000000110110; // input=0.5625, output=0.423753291551
			9'd19: expected_data_function = 16'b0000000000110010; // input=0.59375, output=0.394210803837
			9'd20: expected_data_function = 16'b0000000000101111; // input=0.625, output=0.365298170778
			9'd21: expected_data_function = 16'b0000000000101011; // input=0.65625, output=0.337186369036
			9'd22: expected_data_function = 16'b0000000000101000; // input=0.6875, output=0.310024530917
			9'd23: expected_data_function = 16'b0000000000100100; // input=0.71875, output=0.28393939041
			9'd24: expected_data_function = 16'b0000000000100001; // input=0.75, output=0.259035191332
			9'd25: expected_data_function = 16'b0000000000011110; // input=0.78125, output=0.235394022449
			9'd26: expected_data_function = 16'b0000000000011011; // input=0.8125, output=0.213076536261
			9'd27: expected_data_function = 16'b0000000000011001; // input=0.84375, output=0.19212300181
			9'd28: expected_data_function = 16'b0000000000010110; // input=0.875, output=0.172554637653
			9'd29: expected_data_function = 16'b0000000000010100; // input=0.90625, output=0.154375168879
			9'd30: expected_data_function = 16'b0000000000010010; // input=0.9375, output=0.137572551653
			9'd31: expected_data_function = 16'b0000000000010000; // input=0.96875, output=0.122120810082
			9'd32: expected_data_function = 16'b0000000000001110; // input=1.0, output=0.107981933026
			9'd33: expected_data_function = 16'b0000000000001100; // input=1.03125, output=0.0951077825213
			9'd34: expected_data_function = 16'b0000000000001011; // input=1.0625, output=0.0834419705127
			9'd35: expected_data_function = 16'b0000000000001001; // input=1.09375, output=0.0729216663524
			9'd36: expected_data_function = 16'b0000000000001000; // input=1.125, output=0.0634793036713
			9'd37: expected_data_function = 16'b0000000000000111; // input=1.15625, output=0.0550441616058
			9'd38: expected_data_function = 16'b0000000000000110; // input=1.1875, output=0.0475438016598
			9'd39: expected_data_function = 16'b0000000000000101; // input=1.21875, output=0.0409053475456
			9'd40: expected_data_function = 16'b0000000000000100; // input=1.25, output=0.0350566009871
			9'd41: expected_data_function = 16'b0000000000000100; // input=1.28125, output=0.0299269915718
			9'd42: expected_data_function = 16'b0000000000000011; // input=1.3125, output=0.0254483631937
			9'd43: expected_data_function = 16'b0000000000000011; // input=1.34375, output=0.0215556034005
			9'd44: expected_data_function = 16'b0000000000000010; // input=1.375, output=0.0181871250032
			9'd45: expected_data_function = 16'b0000000000000010; // input=1.40625, output=0.0152852116375
			9'd46: expected_data_function = 16'b0000000000000010; // input=1.4375, output=0.0127962406214
			9'd47: expected_data_function = 16'b0000000000000001; // input=1.46875, output=0.0106707974632
			9'd48: expected_data_function = 16'b0000000000000001; // input=1.5, output=0.00886369682388
			9'd49: expected_data_function = 16'b0000000000000001; // input=1.53125, output=0.00733392469259
			9'd50: expected_data_function = 16'b0000000000000001; // input=1.5625, output=0.0060445160704
			9'd51: expected_data_function = 16'b0000000000000001; // input=1.59375, output=0.00496238167221
			9'd52: expected_data_function = 16'b0000000000000001; // input=1.625, output=0.0040580961146
			9'd53: expected_data_function = 16'b0000000000000000; // input=1.65625, output=0.00330565884481
			9'd54: expected_data_function = 16'b0000000000000000; // input=1.6875, output=0.00268223774698
			9'd55: expected_data_function = 16'b0000000000000000; // input=1.71875, output=0.00216790399823
			9'd56: expected_data_function = 16'b0000000000000000; // input=1.75, output=0.00174536539009
			9'd57: expected_data_function = 16'b0000000000000000; // input=1.78125, output=0.00139970402189
			9'd58: expected_data_function = 16'b0000000000000000; // input=1.8125, output=0.00111812304446
			9'd59: expected_data_function = 16'b0000000000000000; // input=1.84375, output=0.000889706008226
			9'd60: expected_data_function = 16'b0000000000000000; // input=1.875, output=0.000705191364735
			9'd61: expected_data_function = 16'b0000000000000000; // input=1.90625, output=0.000556763793197
			9'd62: expected_data_function = 16'b0000000000000000; // input=1.9375, output=0.000437863275529
			9'd63: expected_data_function = 16'b0000000000000000; // input=1.96875, output=0.000343012222389
			9'd64: expected_data_function = 16'b0000000000000000; // input=2.0, output=0.00026766045153
			9'd65: expected_data_function = 16'b0000000000000000; // input=2.03125, output=0.000208047429535
			9'd66: expected_data_function = 16'b0000000000000000; // input=2.0625, output=0.000161080897111
			9'd67: expected_data_function = 16'b0000000000000000; // input=2.09375, output=0.000124230794341
			9'd68: expected_data_function = 16'b0000000000000000; // input=2.125, output=9.54372730824e-05
			9'd69: expected_data_function = 16'b0000000000000000; // input=2.15625, output=7.30315164609e-05
			9'd70: expected_data_function = 16'b0000000000000000; // input=2.1875, output=5.56680684584e-05
			9'd71: expected_data_function = 16'b0000000000000000; // input=2.21875, output=4.22673990269e-05
			9'd72: expected_data_function = 16'b0000000000000000; // input=2.25, output=3.19674822138e-05
			9'd73: expected_data_function = 16'b0000000000000000; // input=2.28125, output=2.40832380116e-05
			9'd74: expected_data_function = 16'b0000000000000000; // input=2.3125, output=1.80727757781e-05
			9'd75: expected_data_function = 16'b0000000000000000; // input=2.34375, output=1.35094721523e-05
			9'd76: expected_data_function = 16'b0000000000000000; // input=2.375, output=1.00590145772e-05
			9'd77: expected_data_function = 16'b0000000000000000; // input=2.40625, output=7.46063909651e-06
			9'd78: expected_data_function = 16'b0000000000000000; // input=2.4375, output=5.5118851951e-06
			9'd79: expected_data_function = 16'b0000000000000000; // input=2.46875, output=4.05627911931e-06
			9'd80: expected_data_function = 16'b0000000000000000; // input=2.5, output=2.97343902947e-06
			9'd81: expected_data_function = 16'b0000000000000000; // input=2.53125, output=2.17116975587e-06
			9'd82: expected_data_function = 16'b0000000000000000; // input=2.5625, output=1.57918154814e-06
			9'd83: expected_data_function = 16'b0000000000000000; // input=2.59375, output=1.14412606129e-06
			9'd84: expected_data_function = 16'b0000000000000000; // input=2.625, output=8.25694197726e-07
			9'd85: expected_data_function = 16'b0000000000000000; // input=2.65625, output=5.93564781242e-07
			9'd86: expected_data_function = 16'b0000000000000000; // input=2.6875, output=4.25030947662e-07
			9'd87: expected_data_function = 16'b0000000000000000; // input=2.71875, output=3.03163225748e-07
			9'd88: expected_data_function = 16'b0000000000000000; // input=2.75, output=2.15395200851e-07
			9'd89: expected_data_function = 16'b0000000000000000; // input=2.78125, output=1.52440043186e-07
			9'd90: expected_data_function = 16'b0000000000000000; // input=2.8125, output=1.07464653011e-07
			9'd91: expected_data_function = 16'b0000000000000000; // input=2.84375, output=7.54632935059e-08
			9'd92: expected_data_function = 16'b0000000000000000; // input=2.875, output=5.27848640714e-08
			9'd93: expected_data_function = 16'b0000000000000000; // input=2.90625, output=3.67778719754e-08
			9'd94: expected_data_function = 16'b0000000000000000; // input=2.9375, output=2.55250924071e-08
			9'd95: expected_data_function = 16'b0000000000000000; // input=2.96875, output=1.76462158208e-08
			9'd96: expected_data_function = 16'b0000000000000000; // input=3.0, output=1.21517656996e-08
			9'd97: expected_data_function = 16'b0000000000000000; // input=3.03125, output=8.33548213617e-09
			9'd98: expected_data_function = 16'b0000000000000000; // input=3.0625, output=5.69541795659e-09
			9'd99: expected_data_function = 16'b0000000000000000; // input=3.09375, output=3.87635918724e-09
			9'd100: expected_data_function = 16'b0000000000000000; // input=3.125, output=2.62800363631e-09
			9'd101: expected_data_function = 16'b0000000000000000; // input=3.15625, output=1.77472655813e-09
			9'd102: expected_data_function = 16'b0000000000000000; // input=3.1875, output=1.19382445829e-09
			9'd103: expected_data_function = 16'b0000000000000000; // input=3.21875, output=7.99931931389e-10
			9'd104: expected_data_function = 16'b0000000000000000; // input=3.25, output=5.33911322953e-10
			9'd105: expected_data_function = 16'b0000000000000000; // input=3.28125, output=3.54967642802e-10
			9'd106: expected_data_function = 16'b0000000000000000; // input=3.3125, output=2.35077973981e-10
			9'd107: expected_data_function = 16'b0000000000000000; // input=3.34375, output=1.55073878412e-10
			9'd108: expected_data_function = 16'b0000000000000000; // input=3.375, output=1.01898759177e-10
			9'd109: expected_data_function = 16'b0000000000000000; // input=3.40625, output=6.66964440085e-11
			9'd110: expected_data_function = 16'b0000000000000000; // input=3.4375, output=4.34850527144e-11
			9'd111: expected_data_function = 16'b0000000000000000; // input=3.46875, output=2.82410512722e-11
			9'd112: expected_data_function = 16'b0000000000000000; // input=3.5, output=1.82694408167e-11
			9'd113: expected_data_function = 16'b0000000000000000; // input=3.53125, output=1.17726216712e-11
			9'd114: expected_data_function = 16'b0000000000000000; // input=3.5625, output=7.55656909133e-12
			9'd115: expected_data_function = 16'b0000000000000000; // input=3.59375, output=4.83147419902e-12
			9'd116: expected_data_function = 16'b0000000000000000; // input=3.625, output=3.07707590112e-12
			9'd117: expected_data_function = 16'b0000000000000000; // input=3.65625, output=1.95209203954e-12
			9'd118: expected_data_function = 16'b0000000000000000; // input=3.6875, output=1.23357599371e-12
			9'd119: expected_data_function = 16'b0000000000000000; // input=3.71875, output=7.76488565871e-13
			9'd120: expected_data_function = 16'b0000000000000000; // input=3.75, output=4.86864106606e-13
			9'd121: expected_data_function = 16'b0000000000000000; // input=3.78125, output=3.04077291445e-13
			9'd122: expected_data_function = 16'b0000000000000000; // input=3.8125, output=1.89175005616e-13
			9'd123: expected_data_function = 16'b0000000000000000; // input=3.84375, output=1.17232239136e-13
			9'd124: expected_data_function = 16'b0000000000000000; // input=3.875, output=7.23658890223e-14
			9'd125: expected_data_function = 16'b0000000000000000; // input=3.90625, output=4.44963390508e-14
			9'd126: expected_data_function = 16'b0000000000000000; // input=3.9375, output=2.72532435195e-14
			9'd127: expected_data_function = 16'b0000000000000000; // input=3.96875, output=1.66270671268e-14
			9'd128: expected_data_function = 16'b0000000000000000; // input=4.0, output=1.01045421671e-14
			9'd129: expected_data_function = 16'b0000000000000000; // input=4.03125, output=6.11675616292e-15
			9'd130: expected_data_function = 16'b0000000000000000; // input=4.0625, output=3.68832543083e-15
			9'd131: expected_data_function = 16'b0000000000000000; // input=4.09375, output=2.21534227444e-15
			9'd132: expected_data_function = 16'b0000000000000000; // input=4.125, output=1.32542749119e-15
			9'd133: expected_data_function = 16'b0000000000000000; // input=4.15625, output=7.89904613881e-16
			9'd134: expected_data_function = 16'b0000000000000000; // input=4.1875, output=4.68917956941e-16
			9'd135: expected_data_function = 16'b0000000000000000; // input=4.21875, output=2.77282598204e-16
			9'd136: expected_data_function = 16'b0000000000000000; // input=4.25, output=1.63324712633e-16
			9'd137: expected_data_function = 16'b0000000000000000; // input=4.28125, output=9.58263017897e-17
			9'd138: expected_data_function = 16'b0000000000000000; // input=4.3125, output=5.6004263471e-17
			9'd139: expected_data_function = 16'b0000000000000000; // input=4.34375, output=3.26032571594e-17
			9'd140: expected_data_function = 16'b0000000000000000; // input=4.375, output=1.89062077638e-17
			9'd141: expected_data_function = 16'b0000000000000000; // input=4.40625, output=1.09207232111e-17
			9'd142: expected_data_function = 16'b0000000000000000; // input=4.4375, output=6.28350421733e-18
			9'd143: expected_data_function = 16'b0000000000000000; // input=4.46875, output=3.6012722876e-18
			9'd144: expected_data_function = 16'b0000000000000000; // input=4.5, output=2.05595471433e-18
			9'd145: expected_data_function = 16'b0000000000000000; // input=4.53125, output=1.1691619338e-18
			9'd146: expected_data_function = 16'b0000000000000000; // input=4.5625, output=6.62276472038e-19
			9'd147: expected_data_function = 16'b0000000000000000; // input=4.59375, output=3.73686598887e-19
			9'd148: expected_data_function = 16'b0000000000000000; // input=4.625, output=2.10028996599e-19
			9'd149: expected_data_function = 16'b0000000000000000; // input=4.65625, output=1.17585705385e-19
			9'd150: expected_data_function = 16'b0000000000000000; // input=4.6875, output=6.55742507756e-20
			9'd151: expected_data_function = 16'b0000000000000000; // input=4.71875, output=3.64263522358e-20
			9'd152: expected_data_function = 16'b0000000000000000; // input=4.75, output=2.01558707886e-20
			9'd153: expected_data_function = 16'b0000000000000000; // input=4.78125, output=1.11094097589e-20
			9'd154: expected_data_function = 16'b0000000000000000; // input=4.8125, output=6.09935544127e-21
			9'd155: expected_data_function = 16'b0000000000000000; // input=4.84375, output=3.33564970748e-21
			9'd156: expected_data_function = 16'b0000000000000000; // input=4.875, output=1.8171068624e-21
			9'd157: expected_data_function = 16'b0000000000000000; // input=4.90625, output=9.86016170148e-22
			9'd158: expected_data_function = 16'b0000000000000000; // input=4.9375, output=5.32955738878e-22
			9'd159: expected_data_function = 16'b0000000000000000; // input=4.96875, output=2.86947064418e-22
			9'd160: expected_data_function = 16'b0000000000000000; // input=5.0, output=1.53891972534e-22
			9'd161: expected_data_function = 16'b0000000000000000; // input=5.03125, output=8.22117104008e-23
			9'd162: expected_data_function = 16'b0000000000000000; // input=5.0625, output=4.37476710924e-23
			9'd163: expected_data_function = 16'b0000000000000000; // input=5.09375, output=2.31888776995e-23
			9'd164: expected_data_function = 16'b0000000000000000; // input=5.125, output=1.22435697305e-23
			9'd165: expected_data_function = 16'b0000000000000000; // input=5.15625, output=6.43931877481e-24
			9'd166: expected_data_function = 16'b0000000000000000; // input=5.1875, output=3.37345816254e-24
			9'd167: expected_data_function = 16'b0000000000000000; // input=5.21875, output=1.76041179165e-24
			9'd168: expected_data_function = 16'b0000000000000000; // input=5.25, output=9.15075118104e-25
			9'd169: expected_data_function = 16'b0000000000000000; // input=5.28125, output=4.73808405983e-25
			9'd170: expected_data_function = 16'b0000000000000000; // input=5.3125, output=2.4437248966e-25
			9'd171: expected_data_function = 16'b0000000000000000; // input=5.34375, output=1.25546729163e-25
			9'd172: expected_data_function = 16'b0000000000000000; // input=5.375, output=6.42483574324e-26
			9'd173: expected_data_function = 16'b0000000000000000; // input=5.40625, output=3.27508210893e-26
			9'd174: expected_data_function = 16'b0000000000000000; // input=5.4375, output=1.66297566216e-26
			9'd175: expected_data_function = 16'b0000000000000000; // input=5.46875, output=8.41110648574e-27
			9'd176: expected_data_function = 16'b0000000000000000; // input=5.5, output=4.23763850702e-27
			9'd177: expected_data_function = 16'b0000000000000000; // input=5.53125, output=2.12666076412e-27
			9'd178: expected_data_function = 16'b0000000000000000; // input=5.5625, output=1.0631047732e-27
			9'd179: expected_data_function = 16'b0000000000000000; // input=5.59375, output=5.29367719434e-28
			9'd180: expected_data_function = 16'b0000000000000000; // input=5.625, output=2.62568352123e-28
			9'd181: expected_data_function = 16'b0000000000000000; // input=5.65625, output=1.29727138784e-28
			9'd182: expected_data_function = 16'b0000000000000000; // input=5.6875, output=6.38444040927e-29
			9'd183: expected_data_function = 16'b0000000000000000; // input=5.71875, output=3.12981287739e-29
			9'd184: expected_data_function = 16'b0000000000000000; // input=5.75, output=1.52833108232e-29
			9'd185: expected_data_function = 16'b0000000000000000; // input=5.78125, output=7.43395718253e-30
			9'd186: expected_data_function = 16'b0000000000000000; // input=5.8125, output=3.60185480783e-30
			9'd187: expected_data_function = 16'b0000000000000000; // input=5.84375, output=1.73834465408e-30
			9'd188: expected_data_function = 16'b0000000000000000; // input=5.875, output=8.35697508909e-31
			9'd189: expected_data_function = 16'b0000000000000000; // input=5.90625, output=4.00189662571e-31
			9'd190: expected_data_function = 16'b0000000000000000; // input=5.9375, output=1.90891311466e-31
			9'd191: expected_data_function = 16'b0000000000000000; // input=5.96875, output=9.0700565429e-32
			9'd192: expected_data_function = 16'b0000000000000000; // input=6.0, output=4.29276747133e-32
			9'd193: expected_data_function = 16'b0000000000000000; // input=6.03125, output=2.02380316897e-32
			9'd194: expected_data_function = 16'b0000000000000000; // input=6.0625, output=9.50391877478e-33
			9'd195: expected_data_function = 16'b0000000000000000; // input=6.09375, output=4.44570557614e-33
			9'd196: expected_data_function = 16'b0000000000000000; // input=6.125, output=2.07148701924e-33
			9'd197: expected_data_function = 16'b0000000000000000; // input=6.15625, output=9.61451258101e-34
			9'd198: expected_data_function = 16'b0000000000000000; // input=6.1875, output=4.44504196183e-34
			9'd199: expected_data_function = 16'b0000000000000000; // input=6.21875, output=2.04704785425e-34
			9'd200: expected_data_function = 16'b0000000000000000; // input=6.25, output=9.39039071595e-35
			9'd201: expected_data_function = 16'b0000000000000000; // input=6.28125, output=4.29084540294e-35
			9'd202: expected_data_function = 16'b0000000000000000; // input=6.3125, output=1.9530151363e-35
			9'd203: expected_data_function = 16'b0000000000000000; // input=6.34375, output=8.85465996484e-36
			9'd204: expected_data_function = 16'b0000000000000000; // input=6.375, output=3.99891068444e-36
			9'd205: expected_data_function = 16'b0000000000000000; // input=6.40625, output=1.79893328563e-36
			9'd206: expected_data_function = 16'b0000000000000000; // input=6.4375, output=8.06105618402e-37
			9'd207: expected_data_function = 16'b0000000000000000; // input=6.46875, output=3.59809292893e-37
			9'd208: expected_data_function = 16'b0000000000000000; // input=6.5, output=1.5997655514e-37
			9'd209: expected_data_function = 16'b0000000000000000; // input=6.53125, output=7.08506506176e-38
			9'd210: expected_data_function = 16'b0000000000000000; // input=6.5625, output=3.12561067823e-38
			9'd211: expected_data_function = 16'b0000000000000000; // input=6.59375, output=1.37350251292e-38
			9'd212: expected_data_function = 16'b0000000000000000; // input=6.625, output=6.0121190522e-39
			9'd213: expected_data_function = 16'b0000000000000000; // input=6.65625, output=2.62137541904e-39
			9'd214: expected_data_function = 16'b0000000000000000; // input=6.6875, output=1.13850360632e-39
			9'd215: expected_data_function = 16'b0000000000000000; // input=6.71875, output=4.92541848268e-40
			9'd216: expected_data_function = 16'b0000000000000000; // input=6.75, output=2.12253762783e-40
			9'd217: expected_data_function = 16'b0000000000000000; // input=6.78125, output=9.11110806056e-41
			9'd218: expected_data_function = 16'b0000000000000000; // input=6.8125, output=3.89574510993e-41
			9'd219: expected_data_function = 16'b0000000000000000; // input=6.84375, output=1.65925604311e-41
			9'd220: expected_data_function = 16'b0000000000000000; // input=6.875, output=7.03946767599e-42
			9'd221: expected_data_function = 16'b0000000000000000; // input=6.90625, output=2.97488215993e-42
			9'd222: expected_data_function = 16'b0000000000000000; // input=6.9375, output=1.25228521358e-42
			9'd223: expected_data_function = 16'b0000000000000000; // input=6.96875, output=5.25097892486e-43
			9'd224: expected_data_function = 16'b0000000000000000; // input=7.0, output=2.19321311878e-43
			9'd225: expected_data_function = 16'b0000000000000000; // input=7.03125, output=9.12483314748e-44
			9'd226: expected_data_function = 16'b0000000000000000; // input=7.0625, output=3.78157367485e-44
			9'd227: expected_data_function = 16'b0000000000000000; // input=7.09375, output=1.56107488696e-44
			9'd228: expected_data_function = 16'b0000000000000000; // input=7.125, output=6.41916362084e-45
			9'd229: expected_data_function = 16'b0000000000000000; // input=7.15625, output=2.62927911298e-45
			9'd230: expected_data_function = 16'b0000000000000000; // input=7.1875, output=1.07274987899e-45
			9'd231: expected_data_function = 16'b0000000000000000; // input=7.21875, output=4.35977216421e-46
			9'd232: expected_data_function = 16'b0000000000000000; // input=7.25, output=1.76495099492e-46
			9'd233: expected_data_function = 16'b0000000000000000; // input=7.28125, output=7.1171324113e-47
			9'd234: expected_data_function = 16'b0000000000000000; // input=7.3125, output=2.85878159428e-47
			9'd235: expected_data_function = 16'b0000000000000000; // input=7.34375, output=1.14382726918e-47
			9'd236: expected_data_function = 16'b0000000000000000; // input=7.375, output=4.55872560131e-48
			9'd237: expected_data_function = 16'b0000000000000000; // input=7.40625, output=1.80979754616e-48
			9'd238: expected_data_function = 16'b0000000000000000; // input=7.4375, output=7.15681968385e-49
			9'd239: expected_data_function = 16'b0000000000000000; // input=7.46875, output=2.81912084447e-49
			9'd240: expected_data_function = 16'b0000000000000000; // input=7.5, output=1.10614190997e-49
			9'd241: expected_data_function = 16'b0000000000000000; // input=7.53125, output=4.32326183636e-50
			9'd242: expected_data_function = 16'b0000000000000000; // input=7.5625, output=1.68312266462e-50
			9'd243: expected_data_function = 16'b0000000000000000; // input=7.59375, output=6.52714911362e-51
			9'd244: expected_data_function = 16'b0000000000000000; // input=7.625, output=2.52135987788e-51
			9'd245: expected_data_function = 16'b0000000000000000; // input=7.65625, output=9.70174103983e-52
			9'd246: expected_data_function = 16'b0000000000000000; // input=7.6875, output=3.71850231248e-52
			9'd247: expected_data_function = 16'b0000000000000000; // input=7.71875, output=1.41967838716e-52
			9'd248: expected_data_function = 16'b0000000000000000; // input=7.75, output=5.39902604918e-53
			9'd249: expected_data_function = 16'b0000000000000000; // input=7.78125, output=2.04524063202e-53
			9'd250: expected_data_function = 16'b0000000000000000; // input=7.8125, output=7.71750533773e-54
			9'd251: expected_data_function = 16'b0000000000000000; // input=7.84375, output=2.90076804211e-54
			9'd252: expected_data_function = 16'b0000000000000000; // input=7.875, output=1.0860569595e-54
			9'd253: expected_data_function = 16'b0000000000000000; // input=7.90625, output=4.05037972923e-55
			9'd254: expected_data_function = 16'b0000000000000000; // input=7.9375, output=1.50467399787e-55
			9'd255: expected_data_function = 16'b0000000000000000; // input=7.96875, output=5.56791540596e-56
		endcase
            
        end

    end
endfunction
//--------------------------------------------------------------------------------------


//--------------------------------------------------------------------------------------
task test_main;
    reg   [dataLen-1:0] expected_data;
    reg   [dataLen-1:0] received_data;
    begin
        repeat (1000) begin
            //@(posedge clk);
            in = ($random) & ((1 << (fracLen + 5)) - 1);
            expected_data = expected_data_function(in);
            @(negedge clk);
            received_data = out;
            if (received_data !== expected_data) begin
                $display ("\tError: Input: %d, Received data:%d, Expected data:%d", in, received_data, expected_data);
                fail_flag = 1'b1;
            end
        end
        $display ("Passed");
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task check_fail;
    if (fail_flag && !reset) 
    begin
        $display("%c[1;31m",27);
        $display ("Test Failed");
        $display("%c[0m",27);
        $finish;
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
initial begin
    $display("***************************************");
    $display ("Testing gaussian");
    $display("***************************************");
    clk = 0;
    reset = 0;
    @(negedge clk);
    reset = 1;
    @(negedge clk);
    reset = 0;

    test_main;

    $display("%c[1;34m",27);
    $display ("Test Passed");
    $display("%c[0m",27);
    $finish;
end

always #1 clk = ~clk;

always @ (posedge clk)
begin
    check_fail;
end
//--------------------------------------------------------------------------------------

    //initial
    //begin
        //$dumpfile("TB.vcd");
        //$dumpvars(0,pe_compute_tb);
    //end
endmodule

