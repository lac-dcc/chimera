`timescale 1ns/1ps

module sigmoid_tb;
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
	sigmoid #(
		.dataLen    (dataLen)
	) sigmoid_uint (
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
            expected_data_function = 1 << fracLen;
        end else begin
            index = in >> (fracLen - interval_bits);
            //$display("Input: %d, Index: %d", in, index);
		case(index)
			9'd256: expected_data_function = 16'b0000000000000000; // input=-8.0, output=0.000335350130466
			9'd257: expected_data_function = 16'b0000000000000000; // input=-7.96875, output=0.000345991603178
			9'd258: expected_data_function = 16'b0000000000000000; // input=-7.9375, output=0.000356970635038
			9'd259: expected_data_function = 16'b0000000000000000; // input=-7.90625, output=0.000368297926016
			9'd260: expected_data_function = 16'b0000000000000000; // input=-7.875, output=0.000379984514752
			9'd261: expected_data_function = 16'b0000000000000000; // input=-7.84375, output=0.000392041789238
			9'd262: expected_data_function = 16'b0000000000000000; // input=-7.8125, output=0.000404481497842
			9'd263: expected_data_function = 16'b0000000000000000; // input=-7.78125, output=0.000417315760678
			9'd264: expected_data_function = 16'b0000000000000000; // input=-7.75, output=0.000430557081325
			9'd265: expected_data_function = 16'b0000000000000000; // input=-7.71875, output=0.000444218358921
			9'd266: expected_data_function = 16'b0000000000000000; // input=-7.6875, output=0.000458312900635
			9'd267: expected_data_function = 16'b0000000000000000; // input=-7.65625, output=0.00047285443452
			9'd268: expected_data_function = 16'b0000000000000000; // input=-7.625, output=0.000487857122782
			9'd269: expected_data_function = 16'b0000000000000000; // input=-7.59375, output=0.000503335575453
			9'd270: expected_data_function = 16'b0000000000000000; // input=-7.5625, output=0.000519304864495
			9'd271: expected_data_function = 16'b0000000000000000; // input=-7.53125, output=0.000535780538347
			9'd272: expected_data_function = 16'b0000000000000000; // input=-7.5, output=0.000552778636924
			9'd273: expected_data_function = 16'b0000000000000000; // input=-7.46875, output=0.000570315707078
			9'd274: expected_data_function = 16'b0000000000000000; // input=-7.4375, output=0.000588408818557
			9'd275: expected_data_function = 16'b0000000000000000; // input=-7.40625, output=0.000607075580442
			9'd276: expected_data_function = 16'b0000000000000000; // input=-7.375, output=0.000626334158109
			9'd277: expected_data_function = 16'b0000000000000000; // input=-7.34375, output=0.00064620329072
			9'd278: expected_data_function = 16'b0000000000000000; // input=-7.3125, output=0.000666702309244
			9'd279: expected_data_function = 16'b0000000000000000; // input=-7.28125, output=0.000687851155055
			9'd280: expected_data_function = 16'b0000000000000000; // input=-7.25, output=0.000709670399101
			9'd281: expected_data_function = 16'b0000000000000000; // input=-7.21875, output=0.000732181261661
			9'd282: expected_data_function = 16'b0000000000000000; // input=-7.1875, output=0.00075540563273
			9'd283: expected_data_function = 16'b0000000000000000; // input=-7.15625, output=0.000779366093021
			9'd284: expected_data_function = 16'b0000000000000000; // input=-7.125, output=0.000804085935629
			9'd285: expected_data_function = 16'b0000000000000000; // input=-7.09375, output=0.000829589188359
			9'd286: expected_data_function = 16'b0000000000000000; // input=-7.0625, output=0.000855900636745
			9'd287: expected_data_function = 16'b0000000000000000; // input=-7.03125, output=0.000883045847785
			9'd288: expected_data_function = 16'b0000000000000000; // input=-7.0, output=0.000911051194401
			9'd289: expected_data_function = 16'b0000000000000000; // input=-6.96875, output=0.000939943880663
			9'd290: expected_data_function = 16'b0000000000000000; // input=-6.9375, output=0.000969751967783
			9'd291: expected_data_function = 16'b0000000000000000; // input=-6.90625, output=0.00100050440091
			9'd292: expected_data_function = 16'b0000000000000000; // input=-6.875, output=0.00103223103675
			9'd293: expected_data_function = 16'b0000000000000000; // input=-6.84375, output=0.00106496267206
			9'd294: expected_data_function = 16'b0000000000000000; // input=-6.8125, output=0.00109873107292
			9'd295: expected_data_function = 16'b0000000000000000; // input=-6.78125, output=0.00113356900509
			9'd296: expected_data_function = 16'b0000000000000000; // input=-6.75, output=0.00116951026506
			9'd297: expected_data_function = 16'b0000000000000000; // input=-6.71875, output=0.00120658971225
			9'd298: expected_data_function = 16'b0000000000000000; // input=-6.6875, output=0.00124484330209
			9'd299: expected_data_function = 16'b0000000000000000; // input=-6.65625, output=0.00128430812013
			9'd300: expected_data_function = 16'b0000000000000000; // input=-6.625, output=0.00132502241721
			9'd301: expected_data_function = 16'b0000000000000000; // input=-6.59375, output=0.00136702564566
			9'd302: expected_data_function = 16'b0000000000000000; // input=-6.5625, output=0.00141035849662
			9'd303: expected_data_function = 16'b0000000000000000; // input=-6.53125, output=0.00145506293853
			9'd304: expected_data_function = 16'b0000000000000000; // input=-6.5, output=0.00150118225674
			9'd305: expected_data_function = 16'b0000000000000000; // input=-6.46875, output=0.00154876109429
			9'd306: expected_data_function = 16'b0000000000000000; // input=-6.4375, output=0.00159784549402
			9'd307: expected_data_function = 16'b0000000000000000; // input=-6.40625, output=0.00164848294185
			9'd308: expected_data_function = 16'b0000000000000000; // input=-6.375, output=0.00170072241144
			9'd309: expected_data_function = 16'b0000000000000000; // input=-6.34375, output=0.0017546144101
			9'd310: expected_data_function = 16'b0000000000000000; // input=-6.3125, output=0.0018102110262
			9'd311: expected_data_function = 16'b0000000000000000; // input=-6.28125, output=0.00186756597789
			9'd312: expected_data_function = 16'b0000000000000000; // input=-6.25, output=0.00192673466333
			9'd313: expected_data_function = 16'b0000000000000000; // input=-6.21875, output=0.00198777421238
			9'd314: expected_data_function = 16'b0000000000000000; // input=-6.1875, output=0.00205074353992
			9'd315: expected_data_function = 16'b0000000000000000; // input=-6.15625, output=0.00211570340059
			9'd316: expected_data_function = 16'b0000000000000000; // input=-6.125, output=0.00218271644535
			9'd317: expected_data_function = 16'b0000000000000000; // input=-6.09375, output=0.0022518472795
			9'd318: expected_data_function = 16'b0000000000000000; // input=-6.0625, output=0.00232316252263
			9'd319: expected_data_function = 16'b0000000000000000; // input=-6.03125, output=0.00239673087013
			9'd320: expected_data_function = 16'b0000000000000000; // input=-6.0, output=0.00247262315663
			9'd321: expected_data_function = 16'b0000000000000000; // input=-5.96875, output=0.00255091242129
			9'd322: expected_data_function = 16'b0000000000000000; // input=-5.9375, output=0.00263167397488
			9'd323: expected_data_function = 16'b0000000000000000; // input=-5.90625, output=0.00271498546901
			9'd324: expected_data_function = 16'b0000000000000000; // input=-5.875, output=0.00280092696712
			9'd325: expected_data_function = 16'b0000000000000000; // input=-5.84375, output=0.00288958101777
			9'd326: expected_data_function = 16'b0000000000000000; // input=-5.8125, output=0.00298103272985
			9'd327: expected_data_function = 16'b0000000000000000; // input=-5.78125, output=0.00307536985005
			9'd328: expected_data_function = 16'b0000000000000000; // input=-5.75, output=0.00317268284249
			9'd329: expected_data_function = 16'b0000000000000000; // input=-5.71875, output=0.00327306497067
			9'd330: expected_data_function = 16'b0000000000000000; // input=-5.6875, output=0.00337661238174
			9'd331: expected_data_function = 16'b0000000000000000; // input=-5.65625, output=0.00348342419308
			9'd332: expected_data_function = 16'b0000000000000000; // input=-5.625, output=0.00359360258142
			9'd333: expected_data_function = 16'b0000000000000000; // input=-5.59375, output=0.00370725287439
			9'd334: expected_data_function = 16'b0000000000000000; // input=-5.5625, output=0.00382448364464
			9'd335: expected_data_function = 16'b0000000000000001; // input=-5.53125, output=0.0039454068066
			9'd336: expected_data_function = 16'b0000000000000001; // input=-5.5, output=0.0040701377159
			9'd337: expected_data_function = 16'b0000000000000001; // input=-5.46875, output=0.00419879527147
			9'd338: expected_data_function = 16'b0000000000000001; // input=-5.4375, output=0.00433150202056
			9'd339: expected_data_function = 16'b0000000000000001; // input=-5.40625, output=0.00446838426649
			9'd340: expected_data_function = 16'b0000000000000001; // input=-5.375, output=0.00460957217937
			9'd341: expected_data_function = 16'b0000000000000001; // input=-5.34375, output=0.00475519990983
			9'd342: expected_data_function = 16'b0000000000000001; // input=-5.3125, output=0.00490540570572
			9'd343: expected_data_function = 16'b0000000000000001; // input=-5.28125, output=0.00506033203197
			9'd344: expected_data_function = 16'b0000000000000001; // input=-5.25, output=0.00522012569356
			9'd345: expected_data_function = 16'b0000000000000001; // input=-5.21875, output=0.00538493796178
			9'd346: expected_data_function = 16'b0000000000000001; // input=-5.1875, output=0.00555492470369
			9'd347: expected_data_function = 16'b0000000000000001; // input=-5.15625, output=0.00573024651499
			9'd348: expected_data_function = 16'b0000000000000001; // input=-5.125, output=0.00591106885624
			9'd349: expected_data_function = 16'b0000000000000001; // input=-5.09375, output=0.00609756219258
			9'd350: expected_data_function = 16'b0000000000000001; // input=-5.0625, output=0.00628990213689
			9'd351: expected_data_function = 16'b0000000000000001; // input=-5.03125, output=0.00648826959666
			9'd352: expected_data_function = 16'b0000000000000001; // input=-5.0, output=0.00669285092428
			9'd353: expected_data_function = 16'b0000000000000001; // input=-4.96875, output=0.00690383807122
			9'd354: expected_data_function = 16'b0000000000000001; // input=-4.9375, output=0.00712142874574
			9'd355: expected_data_function = 16'b0000000000000001; // input=-4.90625, output=0.00734582657448
			9'd356: expected_data_function = 16'b0000000000000001; // input=-4.875, output=0.00757724126786
			9'd357: expected_data_function = 16'b0000000000000001; // input=-4.84375, output=0.00781588878929
			9'd358: expected_data_function = 16'b0000000000000001; // input=-4.8125, output=0.00806199152827
			9'd359: expected_data_function = 16'b0000000000000001; // input=-4.78125, output=0.00831577847747
			9'd360: expected_data_function = 16'b0000000000000001; // input=-4.75, output=0.00857748541371
			9'd361: expected_data_function = 16'b0000000000000001; // input=-4.71875, output=0.00884735508293
			9'd362: expected_data_function = 16'b0000000000000001; // input=-4.6875, output=0.00912563738918
			9'd363: expected_data_function = 16'b0000000000000001; // input=-4.65625, output=0.00941258958761
			9'd364: expected_data_function = 16'b0000000000000001; // input=-4.625, output=0.00970847648147
			9'd365: expected_data_function = 16'b0000000000000001; // input=-4.59375, output=0.0100135706232
			9'd366: expected_data_function = 16'b0000000000000001; // input=-4.5625, output=0.0103281525193
			9'd367: expected_data_function = 16'b0000000000000001; // input=-4.53125, output=0.0106525108397
			9'd368: expected_data_function = 16'b0000000000000001; // input=-4.5, output=0.0109869426306
			9'd369: expected_data_function = 16'b0000000000000001; // input=-4.46875, output=0.0113317535314
			9'd370: expected_data_function = 16'b0000000000000001; // input=-4.4375, output=0.0116872579957
			9'd371: expected_data_function = 16'b0000000000000010; // input=-4.40625, output=0.0120537795162
			9'd372: expected_data_function = 16'b0000000000000010; // input=-4.375, output=0.0124316508532
			9'd373: expected_data_function = 16'b0000000000000010; // input=-4.34375, output=0.0128212142666
			9'd374: expected_data_function = 16'b0000000000000010; // input=-4.3125, output=0.0132228217523
			9'd375: expected_data_function = 16'b0000000000000010; // input=-4.28125, output=0.0136368352814
			9'd376: expected_data_function = 16'b0000000000000010; // input=-4.25, output=0.0140636270432
			9'd377: expected_data_function = 16'b0000000000000010; // input=-4.21875, output=0.0145035796914
			9'd378: expected_data_function = 16'b0000000000000010; // input=-4.1875, output=0.0149570865931
			9'd379: expected_data_function = 16'b0000000000000010; // input=-4.15625, output=0.0154245520818
			9'd380: expected_data_function = 16'b0000000000000010; // input=-4.125, output=0.0159063917118
			9'd381: expected_data_function = 16'b0000000000000010; // input=-4.09375, output=0.0164030325162
			9'd382: expected_data_function = 16'b0000000000000010; // input=-4.0625, output=0.0169149132667
			9'd383: expected_data_function = 16'b0000000000000010; // input=-4.03125, output=0.0174424847362
			9'd384: expected_data_function = 16'b0000000000000010; // input=-4.0, output=0.0179862099621
			9'd385: expected_data_function = 16'b0000000000000010; // input=-3.96875, output=0.0185465645121
			9'd386: expected_data_function = 16'b0000000000000010; // input=-3.9375, output=0.0191240367509
			9'd387: expected_data_function = 16'b0000000000000011; // input=-3.90625, output=0.0197191281073
			9'd388: expected_data_function = 16'b0000000000000011; // input=-3.875, output=0.0203323533427
			9'd389: expected_data_function = 16'b0000000000000011; // input=-3.84375, output=0.0209642408181
			9'd390: expected_data_function = 16'b0000000000000011; // input=-3.8125, output=0.0216153327626
			9'd391: expected_data_function = 16'b0000000000000011; // input=-3.78125, output=0.0222861855392
			9'd392: expected_data_function = 16'b0000000000000011; // input=-3.75, output=0.02297736991
			9'd393: expected_data_function = 16'b0000000000000011; // input=-3.71875, output=0.0236894712994
			9'd394: expected_data_function = 16'b0000000000000011; // input=-3.6875, output=0.0244230900541
			9'd395: expected_data_function = 16'b0000000000000011; // input=-3.65625, output=0.0251788417006
			9'd396: expected_data_function = 16'b0000000000000011; // input=-3.625, output=0.0259573571978
			9'd397: expected_data_function = 16'b0000000000000011; // input=-3.59375, output=0.0267592831854
			9'd398: expected_data_function = 16'b0000000000000100; // input=-3.5625, output=0.0275852822268
			9'd399: expected_data_function = 16'b0000000000000100; // input=-3.53125, output=0.0284360330449
			9'd400: expected_data_function = 16'b0000000000000100; // input=-3.5, output=0.0293122307514
			9'd401: expected_data_function = 16'b0000000000000100; // input=-3.46875, output=0.0302145870674
			9'd402: expected_data_function = 16'b0000000000000100; // input=-3.4375, output=0.0311438305348
			9'd403: expected_data_function = 16'b0000000000000100; // input=-3.40625, output=0.032100706717
			9'd404: expected_data_function = 16'b0000000000000100; // input=-3.375, output=0.0330859783887
			9'd405: expected_data_function = 16'b0000000000000100; // input=-3.34375, output=0.0341004257123
			9'd406: expected_data_function = 16'b0000000000000100; // input=-3.3125, output=0.0351448464008
			9'd407: expected_data_function = 16'b0000000000000101; // input=-3.28125, output=0.036220055865
			9'd408: expected_data_function = 16'b0000000000000101; // input=-3.25, output=0.0373268873441
			9'd409: expected_data_function = 16'b0000000000000101; // input=-3.21875, output=0.0384661920183
			9'd410: expected_data_function = 16'b0000000000000101; // input=-3.1875, output=0.039638839101
			9'd411: expected_data_function = 16'b0000000000000101; // input=-3.15625, output=0.0408457159099
			9'd412: expected_data_function = 16'b0000000000000101; // input=-3.125, output=0.0420877279156
			9'd413: expected_data_function = 16'b0000000000000110; // input=-3.09375, output=0.0433657987639
			9'd414: expected_data_function = 16'b0000000000000110; // input=-3.0625, output=0.0446808702727
			9'd415: expected_data_function = 16'b0000000000000110; // input=-3.03125, output=0.0460339023992
			9'd416: expected_data_function = 16'b0000000000000110; // input=-3.0, output=0.0474258731776
			9'd417: expected_data_function = 16'b0000000000000110; // input=-2.96875, output=0.0488577786222
			9'd418: expected_data_function = 16'b0000000000000110; // input=-2.9375, output=0.0503306325975
			9'd419: expected_data_function = 16'b0000000000000111; // input=-2.90625, output=0.0518454666498
			9'd420: expected_data_function = 16'b0000000000000111; // input=-2.875, output=0.0534033297998
			9'd421: expected_data_function = 16'b0000000000000111; // input=-2.84375, output=0.0550052882935
			9'd422: expected_data_function = 16'b0000000000000111; // input=-2.8125, output=0.056652425308
			9'd423: expected_data_function = 16'b0000000000000111; // input=-2.78125, output=0.0583458406117
			9'd424: expected_data_function = 16'b0000000000001000; // input=-2.75, output=0.060086650174
			9'd425: expected_data_function = 16'b0000000000001000; // input=-2.71875, output=0.0618759857236
			9'd426: expected_data_function = 16'b0000000000001000; // input=-2.6875, output=0.063714994252
			9'd427: expected_data_function = 16'b0000000000001000; // input=-2.65625, output=0.0656048374591
			9'd428: expected_data_function = 16'b0000000000001001; // input=-2.625, output=0.0675466911396
			9'd429: expected_data_function = 16'b0000000000001001; // input=-2.59375, output=0.0695417445058
			9'd430: expected_data_function = 16'b0000000000001001; // input=-2.5625, output=0.0715911994446
			9'd431: expected_data_function = 16'b0000000000001001; // input=-2.53125, output=0.073696269706
			9'd432: expected_data_function = 16'b0000000000001010; // input=-2.5, output=0.0758581800212
			9'd433: expected_data_function = 16'b0000000000001010; // input=-2.46875, output=0.078078165145
			9'd434: expected_data_function = 16'b0000000000001010; // input=-2.4375, output=0.0803574688222
			9'd435: expected_data_function = 16'b0000000000001011; // input=-2.40625, output=0.082697342675
			9'd436: expected_data_function = 16'b0000000000001011; // input=-2.375, output=0.085099045007
			9'd437: expected_data_function = 16'b0000000000001011; // input=-2.34375, output=0.0875638395231
			9'd438: expected_data_function = 16'b0000000000001100; // input=-2.3125, output=0.090092993962
			9'd439: expected_data_function = 16'b0000000000001100; // input=-2.28125, output=0.0926877786394
			9'd440: expected_data_function = 16'b0000000000001100; // input=-2.25, output=0.0953494648991
			9'd441: expected_data_function = 16'b0000000000001101; // input=-2.21875, output=0.0980793234705
			9'd442: expected_data_function = 16'b0000000000001101; // input=-2.1875, output=0.10087862273
			9'd443: expected_data_function = 16'b0000000000001101; // input=-2.15625, output=0.103748626866
			9'd444: expected_data_function = 16'b0000000000001110; // input=-2.125, output=0.106690593946
			9'd445: expected_data_function = 16'b0000000000001110; // input=-2.09375, output=0.109705773878
			9'd446: expected_data_function = 16'b0000000000001110; // input=-2.0625, output=0.112795406283
			9'd447: expected_data_function = 16'b0000000000001111; // input=-2.03125, output=0.115960718254
			9'd448: expected_data_function = 16'b0000000000001111; // input=-2.0, output=0.119202922022
			9'd449: expected_data_function = 16'b0000000000010000; // input=-1.96875, output=0.122523212518
			9'd450: expected_data_function = 16'b0000000000010000; // input=-1.9375, output=0.125922764835
			9'd451: expected_data_function = 16'b0000000000010001; // input=-1.90625, output=0.129402731592
			9'd452: expected_data_function = 16'b0000000000010001; // input=-1.875, output=0.132964240198
			9'd453: expected_data_function = 16'b0000000000010001; // input=-1.84375, output=0.136608390026
			9'd454: expected_data_function = 16'b0000000000010010; // input=-1.8125, output=0.14033624949
			9'd455: expected_data_function = 16'b0000000000010010; // input=-1.78125, output=0.144148853033
			9'd456: expected_data_function = 16'b0000000000010011; // input=-1.75, output=0.148047198032
			9'd457: expected_data_function = 16'b0000000000010011; // input=-1.71875, output=0.152032241622
			9'd458: expected_data_function = 16'b0000000000010100; // input=-1.6875, output=0.156104897445
			9'd459: expected_data_function = 16'b0000000000010101; // input=-1.65625, output=0.160266032328
			9'd460: expected_data_function = 16'b0000000000010101; // input=-1.625, output=0.164516462897
			9'd461: expected_data_function = 16'b0000000000010110; // input=-1.59375, output=0.168856952142
			9'd462: expected_data_function = 16'b0000000000010110; // input=-1.5625, output=0.173288205929
			9'd463: expected_data_function = 16'b0000000000010111; // input=-1.53125, output=0.177810869478
			9'd464: expected_data_function = 16'b0000000000010111; // input=-1.5, output=0.182425523806
			9'd465: expected_data_function = 16'b0000000000011000; // input=-1.46875, output=0.187132682162
			9'd466: expected_data_function = 16'b0000000000011001; // input=-1.4375, output=0.191932786447
			9'd467: expected_data_function = 16'b0000000000011001; // input=-1.40625, output=0.196826203643
			9'd468: expected_data_function = 16'b0000000000011010; // input=-1.375, output=0.20181322226
			9'd469: expected_data_function = 16'b0000000000011010; // input=-1.34375, output=0.206894048816
			9'd470: expected_data_function = 16'b0000000000011011; // input=-1.3125, output=0.212068804357
			9'd471: expected_data_function = 16'b0000000000011100; // input=-1.28125, output=0.217337521047
			9'd472: expected_data_function = 16'b0000000000011101; // input=-1.25, output=0.222700138825
			9'd473: expected_data_function = 16'b0000000000011101; // input=-1.21875, output=0.228156502161
			9'd474: expected_data_function = 16'b0000000000011110; // input=-1.1875, output=0.233706356914
			9'd475: expected_data_function = 16'b0000000000011111; // input=-1.15625, output=0.239349347323
			9'd476: expected_data_function = 16'b0000000000011111; // input=-1.125, output=0.245085013132
			9'd477: expected_data_function = 16'b0000000000100000; // input=-1.09375, output=0.250912786885
			9'd478: expected_data_function = 16'b0000000000100001; // input=-1.0625, output=0.256831991388
			9'd479: expected_data_function = 16'b0000000000100010; // input=-1.03125, output=0.262841837371
			9'd480: expected_data_function = 16'b0000000000100010; // input=-1.0, output=0.26894142137
			9'd481: expected_data_function = 16'b0000000000100011; // input=-0.96875, output=0.275129723823
			9'd482: expected_data_function = 16'b0000000000100100; // input=-0.9375, output=0.281405607429
			9'd483: expected_data_function = 16'b0000000000100101; // input=-0.90625, output=0.287767815761
			9'd484: expected_data_function = 16'b0000000000100110; // input=-0.875, output=0.294214972163
			9'd485: expected_data_function = 16'b0000000000100110; // input=-0.84375, output=0.300745578941
			9'd486: expected_data_function = 16'b0000000000100111; // input=-0.8125, output=0.307358016865
			9'd487: expected_data_function = 16'b0000000000101000; // input=-0.78125, output=0.314050544992
			9'd488: expected_data_function = 16'b0000000000101001; // input=-0.75, output=0.320821300825
			9'd489: expected_data_function = 16'b0000000000101010; // input=-0.71875, output=0.327668300821
			9'd490: expected_data_function = 16'b0000000000101011; // input=-0.6875, output=0.334589441253
			9'd491: expected_data_function = 16'b0000000000101100; // input=-0.65625, output=0.341582499438
			9'd492: expected_data_function = 16'b0000000000101101; // input=-0.625, output=0.348645135334
			9'd493: expected_data_function = 16'b0000000000101110; // input=-0.59375, output=0.355774893514
			9'd494: expected_data_function = 16'b0000000000101110; // input=-0.5625, output=0.36296920552
			9'd495: expected_data_function = 16'b0000000000101111; // input=-0.53125, output=0.370225392596
			9'd496: expected_data_function = 16'b0000000000110000; // input=-0.5, output=0.377540668798
			9'd497: expected_data_function = 16'b0000000000110001; // input=-0.46875, output=0.384912144484
			9'd498: expected_data_function = 16'b0000000000110010; // input=-0.4375, output=0.392336830167
			9'd499: expected_data_function = 16'b0000000000110011; // input=-0.40625, output=0.39981164074
			9'd500: expected_data_function = 16'b0000000000110100; // input=-0.375, output=0.407333400046
			9'd501: expected_data_function = 16'b0000000000110101; // input=-0.34375, output=0.414898845797
			9'd502: expected_data_function = 16'b0000000000110110; // input=-0.3125, output=0.422504634814
			9'd503: expected_data_function = 16'b0000000000110111; // input=-0.28125, output=0.430147348586
			9'd504: expected_data_function = 16'b0000000000111000; // input=-0.25, output=0.437823499114
			9'd505: expected_data_function = 16'b0000000000111001; // input=-0.21875, output=0.44552953504
			9'd506: expected_data_function = 16'b0000000000111010; // input=-0.1875, output=0.453261848015
			9'd507: expected_data_function = 16'b0000000000111011; // input=-0.15625, output=0.461016779312
			9'd508: expected_data_function = 16'b0000000000111100; // input=-0.125, output=0.468790626626
			9'd509: expected_data_function = 16'b0000000000111101; // input=-0.09375, output=0.476579651064
			9'd510: expected_data_function = 16'b0000000000111110; // input=-0.0625, output=0.484380084277
			9'd511: expected_data_function = 16'b0000000000111111; // input=-0.03125, output=0.492188135721
			9'd0: expected_data_function = 16'b0000000001000000; // input=0.0, output=0.5
			9'd1: expected_data_function = 16'b0000000001000001; // input=0.03125, output=0.507811864279
			9'd2: expected_data_function = 16'b0000000001000010; // input=0.0625, output=0.515619915723
			9'd3: expected_data_function = 16'b0000000001000011; // input=0.09375, output=0.523420348936
			9'd4: expected_data_function = 16'b0000000001000100; // input=0.125, output=0.531209373374
			9'd5: expected_data_function = 16'b0000000001000101; // input=0.15625, output=0.538983220688
			9'd6: expected_data_function = 16'b0000000001000110; // input=0.1875, output=0.546738151985
			9'd7: expected_data_function = 16'b0000000001000111; // input=0.21875, output=0.55447046496
			9'd8: expected_data_function = 16'b0000000001001000; // input=0.25, output=0.562176500886
			9'd9: expected_data_function = 16'b0000000001001001; // input=0.28125, output=0.569852651414
			9'd10: expected_data_function = 16'b0000000001001010; // input=0.3125, output=0.577495365186
			9'd11: expected_data_function = 16'b0000000001001011; // input=0.34375, output=0.585101154203
			9'd12: expected_data_function = 16'b0000000001001100; // input=0.375, output=0.592666599954
			9'd13: expected_data_function = 16'b0000000001001101; // input=0.40625, output=0.60018835926
			9'd14: expected_data_function = 16'b0000000001001110; // input=0.4375, output=0.607663169833
			9'd15: expected_data_function = 16'b0000000001001111; // input=0.46875, output=0.615087855516
			9'd16: expected_data_function = 16'b0000000001010000; // input=0.5, output=0.622459331202
			9'd17: expected_data_function = 16'b0000000001010001; // input=0.53125, output=0.629774607404
			9'd18: expected_data_function = 16'b0000000001010010; // input=0.5625, output=0.63703079448
			9'd19: expected_data_function = 16'b0000000001010010; // input=0.59375, output=0.644225106486
			9'd20: expected_data_function = 16'b0000000001010011; // input=0.625, output=0.651354864666
			9'd21: expected_data_function = 16'b0000000001010100; // input=0.65625, output=0.658417500562
			9'd22: expected_data_function = 16'b0000000001010101; // input=0.6875, output=0.665410558747
			9'd23: expected_data_function = 16'b0000000001010110; // input=0.71875, output=0.672331699179
			9'd24: expected_data_function = 16'b0000000001010111; // input=0.75, output=0.679178699175
			9'd25: expected_data_function = 16'b0000000001011000; // input=0.78125, output=0.685949455008
			9'd26: expected_data_function = 16'b0000000001011001; // input=0.8125, output=0.692641983135
			9'd27: expected_data_function = 16'b0000000001011010; // input=0.84375, output=0.699254421059
			9'd28: expected_data_function = 16'b0000000001011010; // input=0.875, output=0.705785027837
			9'd29: expected_data_function = 16'b0000000001011011; // input=0.90625, output=0.712232184239
			9'd30: expected_data_function = 16'b0000000001011100; // input=0.9375, output=0.718594392571
			9'd31: expected_data_function = 16'b0000000001011101; // input=0.96875, output=0.724870276177
			9'd32: expected_data_function = 16'b0000000001011110; // input=1.0, output=0.73105857863
			9'd33: expected_data_function = 16'b0000000001011110; // input=1.03125, output=0.737158162629
			9'd34: expected_data_function = 16'b0000000001011111; // input=1.0625, output=0.743168008612
			9'd35: expected_data_function = 16'b0000000001100000; // input=1.09375, output=0.749087213115
			9'd36: expected_data_function = 16'b0000000001100001; // input=1.125, output=0.754914986868
			9'd37: expected_data_function = 16'b0000000001100001; // input=1.15625, output=0.760650652677
			9'd38: expected_data_function = 16'b0000000001100010; // input=1.1875, output=0.766293643086
			9'd39: expected_data_function = 16'b0000000001100011; // input=1.21875, output=0.771843497839
			9'd40: expected_data_function = 16'b0000000001100011; // input=1.25, output=0.777299861175
			9'd41: expected_data_function = 16'b0000000001100100; // input=1.28125, output=0.782662478953
			9'd42: expected_data_function = 16'b0000000001100101; // input=1.3125, output=0.787931195643
			9'd43: expected_data_function = 16'b0000000001100110; // input=1.34375, output=0.793105951184
			9'd44: expected_data_function = 16'b0000000001100110; // input=1.375, output=0.79818677774
			9'd45: expected_data_function = 16'b0000000001100111; // input=1.40625, output=0.803173796357
			9'd46: expected_data_function = 16'b0000000001100111; // input=1.4375, output=0.808067213553
			9'd47: expected_data_function = 16'b0000000001101000; // input=1.46875, output=0.812867317838
			9'd48: expected_data_function = 16'b0000000001101001; // input=1.5, output=0.817574476194
			9'd49: expected_data_function = 16'b0000000001101001; // input=1.53125, output=0.822189130522
			9'd50: expected_data_function = 16'b0000000001101010; // input=1.5625, output=0.826711794071
			9'd51: expected_data_function = 16'b0000000001101010; // input=1.59375, output=0.831143047858
			9'd52: expected_data_function = 16'b0000000001101011; // input=1.625, output=0.835483537103
			9'd53: expected_data_function = 16'b0000000001101011; // input=1.65625, output=0.839733967672
			9'd54: expected_data_function = 16'b0000000001101100; // input=1.6875, output=0.843895102555
			9'd55: expected_data_function = 16'b0000000001101101; // input=1.71875, output=0.847967758378
			9'd56: expected_data_function = 16'b0000000001101101; // input=1.75, output=0.851952801968
			9'd57: expected_data_function = 16'b0000000001101110; // input=1.78125, output=0.855851146967
			9'd58: expected_data_function = 16'b0000000001101110; // input=1.8125, output=0.85966375051
			9'd59: expected_data_function = 16'b0000000001101111; // input=1.84375, output=0.863391609974
			9'd60: expected_data_function = 16'b0000000001101111; // input=1.875, output=0.867035759802
			9'd61: expected_data_function = 16'b0000000001101111; // input=1.90625, output=0.870597268408
			9'd62: expected_data_function = 16'b0000000001110000; // input=1.9375, output=0.874077235165
			9'd63: expected_data_function = 16'b0000000001110000; // input=1.96875, output=0.877476787482
			9'd64: expected_data_function = 16'b0000000001110001; // input=2.0, output=0.880797077978
			9'd65: expected_data_function = 16'b0000000001110001; // input=2.03125, output=0.884039281746
			9'd66: expected_data_function = 16'b0000000001110010; // input=2.0625, output=0.887204593717
			9'd67: expected_data_function = 16'b0000000001110010; // input=2.09375, output=0.890294226122
			9'd68: expected_data_function = 16'b0000000001110010; // input=2.125, output=0.893309406054
			9'd69: expected_data_function = 16'b0000000001110011; // input=2.15625, output=0.896251373134
			9'd70: expected_data_function = 16'b0000000001110011; // input=2.1875, output=0.89912137727
			9'd71: expected_data_function = 16'b0000000001110011; // input=2.21875, output=0.90192067653
			9'd72: expected_data_function = 16'b0000000001110100; // input=2.25, output=0.904650535101
			9'd73: expected_data_function = 16'b0000000001110100; // input=2.28125, output=0.907312221361
			9'd74: expected_data_function = 16'b0000000001110100; // input=2.3125, output=0.909907006038
			9'd75: expected_data_function = 16'b0000000001110101; // input=2.34375, output=0.912436160477
			9'd76: expected_data_function = 16'b0000000001110101; // input=2.375, output=0.914900954993
			9'd77: expected_data_function = 16'b0000000001110101; // input=2.40625, output=0.917302657325
			9'd78: expected_data_function = 16'b0000000001110110; // input=2.4375, output=0.919642531178
			9'd79: expected_data_function = 16'b0000000001110110; // input=2.46875, output=0.921921834855
			9'd80: expected_data_function = 16'b0000000001110110; // input=2.5, output=0.924141819979
			9'd81: expected_data_function = 16'b0000000001110111; // input=2.53125, output=0.926303730294
			9'd82: expected_data_function = 16'b0000000001110111; // input=2.5625, output=0.928408800555
			9'd83: expected_data_function = 16'b0000000001110111; // input=2.59375, output=0.930458255494
			9'd84: expected_data_function = 16'b0000000001110111; // input=2.625, output=0.93245330886
			9'd85: expected_data_function = 16'b0000000001111000; // input=2.65625, output=0.934395162541
			9'd86: expected_data_function = 16'b0000000001111000; // input=2.6875, output=0.936285005748
			9'd87: expected_data_function = 16'b0000000001111000; // input=2.71875, output=0.938124014276
			9'd88: expected_data_function = 16'b0000000001111000; // input=2.75, output=0.939913349826
			9'd89: expected_data_function = 16'b0000000001111001; // input=2.78125, output=0.941654159388
			9'd90: expected_data_function = 16'b0000000001111001; // input=2.8125, output=0.943347574692
			9'd91: expected_data_function = 16'b0000000001111001; // input=2.84375, output=0.944994711707
			9'd92: expected_data_function = 16'b0000000001111001; // input=2.875, output=0.9465966702
			9'd93: expected_data_function = 16'b0000000001111001; // input=2.90625, output=0.94815453335
			9'd94: expected_data_function = 16'b0000000001111010; // input=2.9375, output=0.949669367403
			9'd95: expected_data_function = 16'b0000000001111010; // input=2.96875, output=0.951142221378
			9'd96: expected_data_function = 16'b0000000001111010; // input=3.0, output=0.952574126822
			9'd97: expected_data_function = 16'b0000000001111010; // input=3.03125, output=0.953966097601
			9'd98: expected_data_function = 16'b0000000001111010; // input=3.0625, output=0.955319129727
			9'd99: expected_data_function = 16'b0000000001111010; // input=3.09375, output=0.956634201236
			9'd100: expected_data_function = 16'b0000000001111011; // input=3.125, output=0.957912272084
			9'd101: expected_data_function = 16'b0000000001111011; // input=3.15625, output=0.95915428409
			9'd102: expected_data_function = 16'b0000000001111011; // input=3.1875, output=0.960361160899
			9'd103: expected_data_function = 16'b0000000001111011; // input=3.21875, output=0.961533807982
			9'd104: expected_data_function = 16'b0000000001111011; // input=3.25, output=0.962673112656
			9'd105: expected_data_function = 16'b0000000001111011; // input=3.28125, output=0.963779944135
			9'd106: expected_data_function = 16'b0000000001111100; // input=3.3125, output=0.964855153599
			9'd107: expected_data_function = 16'b0000000001111100; // input=3.34375, output=0.965899574288
			9'd108: expected_data_function = 16'b0000000001111100; // input=3.375, output=0.966914021611
			9'd109: expected_data_function = 16'b0000000001111100; // input=3.40625, output=0.967899293283
			9'd110: expected_data_function = 16'b0000000001111100; // input=3.4375, output=0.968856169465
			9'd111: expected_data_function = 16'b0000000001111100; // input=3.46875, output=0.969785412933
			9'd112: expected_data_function = 16'b0000000001111100; // input=3.5, output=0.970687769249
			9'd113: expected_data_function = 16'b0000000001111100; // input=3.53125, output=0.971563966955
			9'd114: expected_data_function = 16'b0000000001111100; // input=3.5625, output=0.972414717773
			9'd115: expected_data_function = 16'b0000000001111101; // input=3.59375, output=0.973240716815
			9'd116: expected_data_function = 16'b0000000001111101; // input=3.625, output=0.974042642802
			9'd117: expected_data_function = 16'b0000000001111101; // input=3.65625, output=0.974821158299
			9'd118: expected_data_function = 16'b0000000001111101; // input=3.6875, output=0.975576909946
			9'd119: expected_data_function = 16'b0000000001111101; // input=3.71875, output=0.976310528701
			9'd120: expected_data_function = 16'b0000000001111101; // input=3.75, output=0.97702263009
			9'd121: expected_data_function = 16'b0000000001111101; // input=3.78125, output=0.977713814461
			9'd122: expected_data_function = 16'b0000000001111101; // input=3.8125, output=0.978384667237
			9'd123: expected_data_function = 16'b0000000001111101; // input=3.84375, output=0.979035759182
			9'd124: expected_data_function = 16'b0000000001111101; // input=3.875, output=0.979667646657
			9'd125: expected_data_function = 16'b0000000001111101; // input=3.90625, output=0.980280871893
			9'd126: expected_data_function = 16'b0000000001111110; // input=3.9375, output=0.980875963249
			9'd127: expected_data_function = 16'b0000000001111110; // input=3.96875, output=0.981453435488
			9'd128: expected_data_function = 16'b0000000001111110; // input=4.0, output=0.982013790038
			9'd129: expected_data_function = 16'b0000000001111110; // input=4.03125, output=0.982557515264
			9'd130: expected_data_function = 16'b0000000001111110; // input=4.0625, output=0.983085086733
			9'd131: expected_data_function = 16'b0000000001111110; // input=4.09375, output=0.983596967484
			9'd132: expected_data_function = 16'b0000000001111110; // input=4.125, output=0.984093608288
			9'd133: expected_data_function = 16'b0000000001111110; // input=4.15625, output=0.984575447918
			9'd134: expected_data_function = 16'b0000000001111110; // input=4.1875, output=0.985042913407
			9'd135: expected_data_function = 16'b0000000001111110; // input=4.21875, output=0.985496420309
			9'd136: expected_data_function = 16'b0000000001111110; // input=4.25, output=0.985936372957
			9'd137: expected_data_function = 16'b0000000001111110; // input=4.28125, output=0.986363164719
			9'd138: expected_data_function = 16'b0000000001111110; // input=4.3125, output=0.986777178248
			9'd139: expected_data_function = 16'b0000000001111110; // input=4.34375, output=0.987178785733
			9'd140: expected_data_function = 16'b0000000001111110; // input=4.375, output=0.987568349147
			9'd141: expected_data_function = 16'b0000000001111110; // input=4.40625, output=0.987946220484
			9'd142: expected_data_function = 16'b0000000001111111; // input=4.4375, output=0.988312742004
			9'd143: expected_data_function = 16'b0000000001111111; // input=4.46875, output=0.988668246469
			9'd144: expected_data_function = 16'b0000000001111111; // input=4.5, output=0.989013057369
			9'd145: expected_data_function = 16'b0000000001111111; // input=4.53125, output=0.98934748916
			9'd146: expected_data_function = 16'b0000000001111111; // input=4.5625, output=0.989671847481
			9'd147: expected_data_function = 16'b0000000001111111; // input=4.59375, output=0.989986429377
			9'd148: expected_data_function = 16'b0000000001111111; // input=4.625, output=0.990291523519
			9'd149: expected_data_function = 16'b0000000001111111; // input=4.65625, output=0.990587410412
			9'd150: expected_data_function = 16'b0000000001111111; // input=4.6875, output=0.990874362611
			9'd151: expected_data_function = 16'b0000000001111111; // input=4.71875, output=0.991152644917
			9'd152: expected_data_function = 16'b0000000001111111; // input=4.75, output=0.991422514586
			9'd153: expected_data_function = 16'b0000000001111111; // input=4.78125, output=0.991684221523
			9'd154: expected_data_function = 16'b0000000001111111; // input=4.8125, output=0.991938008472
			9'd155: expected_data_function = 16'b0000000001111111; // input=4.84375, output=0.992184111211
			9'd156: expected_data_function = 16'b0000000001111111; // input=4.875, output=0.992422758732
			9'd157: expected_data_function = 16'b0000000001111111; // input=4.90625, output=0.992654173426
			9'd158: expected_data_function = 16'b0000000001111111; // input=4.9375, output=0.992878571254
			9'd159: expected_data_function = 16'b0000000001111111; // input=4.96875, output=0.993096161929
			9'd160: expected_data_function = 16'b0000000001111111; // input=5.0, output=0.993307149076
			9'd161: expected_data_function = 16'b0000000001111111; // input=5.03125, output=0.993511730403
			9'd162: expected_data_function = 16'b0000000001111111; // input=5.0625, output=0.993710097863
			9'd163: expected_data_function = 16'b0000000001111111; // input=5.09375, output=0.993902437807
			9'd164: expected_data_function = 16'b0000000001111111; // input=5.125, output=0.994088931144
			9'd165: expected_data_function = 16'b0000000001111111; // input=5.15625, output=0.994269753485
			9'd166: expected_data_function = 16'b0000000001111111; // input=5.1875, output=0.994445075296
			9'd167: expected_data_function = 16'b0000000001111111; // input=5.21875, output=0.994615062038
			9'd168: expected_data_function = 16'b0000000001111111; // input=5.25, output=0.994779874306
			9'd169: expected_data_function = 16'b0000000001111111; // input=5.28125, output=0.994939667968
			9'd170: expected_data_function = 16'b0000000001111111; // input=5.3125, output=0.995094594294
			9'd171: expected_data_function = 16'b0000000001111111; // input=5.34375, output=0.99524480009
			9'd172: expected_data_function = 16'b0000000001111111; // input=5.375, output=0.995390427821
			9'd173: expected_data_function = 16'b0000000001111111; // input=5.40625, output=0.995531615734
			9'd174: expected_data_function = 16'b0000000001111111; // input=5.4375, output=0.995668497979
			9'd175: expected_data_function = 16'b0000000001111111; // input=5.46875, output=0.995801204729
			9'd176: expected_data_function = 16'b0000000001111111; // input=5.5, output=0.995929862284
			9'd177: expected_data_function = 16'b0000000001111111; // input=5.53125, output=0.996054593193
			9'd178: expected_data_function = 16'b0000000001111111; // input=5.5625, output=0.996175516355
			9'd179: expected_data_function = 16'b0000000001111111; // input=5.59375, output=0.996292747126
			9'd180: expected_data_function = 16'b0000000001111111; // input=5.625, output=0.996406397419
			9'd181: expected_data_function = 16'b0000000001111111; // input=5.65625, output=0.996516575807
			9'd182: expected_data_function = 16'b0000000001111111; // input=5.6875, output=0.996623387618
			9'd183: expected_data_function = 16'b0000000001111111; // input=5.71875, output=0.996726935029
			9'd184: expected_data_function = 16'b0000000001111111; // input=5.75, output=0.996827317158
			9'd185: expected_data_function = 16'b0000000001111111; // input=5.78125, output=0.99692463015
			9'd186: expected_data_function = 16'b0000000001111111; // input=5.8125, output=0.99701896727
			9'd187: expected_data_function = 16'b0000000001111111; // input=5.84375, output=0.997110418982
			9'd188: expected_data_function = 16'b0000000001111111; // input=5.875, output=0.997199073033
			9'd189: expected_data_function = 16'b0000000001111111; // input=5.90625, output=0.997285014531
			9'd190: expected_data_function = 16'b0000000001111111; // input=5.9375, output=0.997368326025
			9'd191: expected_data_function = 16'b0000000001111111; // input=5.96875, output=0.997449087579
			9'd192: expected_data_function = 16'b0000000001111111; // input=6.0, output=0.997527376843
			9'd193: expected_data_function = 16'b0000000001111111; // input=6.03125, output=0.99760326913
			9'd194: expected_data_function = 16'b0000000001111111; // input=6.0625, output=0.997676837477
			9'd195: expected_data_function = 16'b0000000001111111; // input=6.09375, output=0.99774815272
			9'd196: expected_data_function = 16'b0000000001111111; // input=6.125, output=0.997817283555
			9'd197: expected_data_function = 16'b0000000001111111; // input=6.15625, output=0.997884296599
			9'd198: expected_data_function = 16'b0000000001111111; // input=6.1875, output=0.99794925646
			9'd199: expected_data_function = 16'b0000000001111111; // input=6.21875, output=0.998012225788
			9'd200: expected_data_function = 16'b0000000001111111; // input=6.25, output=0.998073265337
			9'd201: expected_data_function = 16'b0000000001111111; // input=6.28125, output=0.998132434022
			9'd202: expected_data_function = 16'b0000000001111111; // input=6.3125, output=0.998189788974
			9'd203: expected_data_function = 16'b0000000001111111; // input=6.34375, output=0.99824538559
			9'd204: expected_data_function = 16'b0000000001111111; // input=6.375, output=0.998299277589
			9'd205: expected_data_function = 16'b0000000001111111; // input=6.40625, output=0.998351517058
			9'd206: expected_data_function = 16'b0000000001111111; // input=6.4375, output=0.998402154506
			9'd207: expected_data_function = 16'b0000000001111111; // input=6.46875, output=0.998451238906
			9'd208: expected_data_function = 16'b0000000001111111; // input=6.5, output=0.998498817743
			9'd209: expected_data_function = 16'b0000000001111111; // input=6.53125, output=0.998544937061
			9'd210: expected_data_function = 16'b0000000001111111; // input=6.5625, output=0.998589641503
			9'd211: expected_data_function = 16'b0000000001111111; // input=6.59375, output=0.998632974354
			9'd212: expected_data_function = 16'b0000000001111111; // input=6.625, output=0.998674977583
			9'd213: expected_data_function = 16'b0000000001111111; // input=6.65625, output=0.99871569188
			9'd214: expected_data_function = 16'b0000000001111111; // input=6.6875, output=0.998755156698
			9'd215: expected_data_function = 16'b0000000001111111; // input=6.71875, output=0.998793410288
			9'd216: expected_data_function = 16'b0000000001111111; // input=6.75, output=0.998830489735
			9'd217: expected_data_function = 16'b0000000001111111; // input=6.78125, output=0.998866430995
			9'd218: expected_data_function = 16'b0000000001111111; // input=6.8125, output=0.998901268927
			9'd219: expected_data_function = 16'b0000000001111111; // input=6.84375, output=0.998935037328
			9'd220: expected_data_function = 16'b0000000001111111; // input=6.875, output=0.998967768963
			9'd221: expected_data_function = 16'b0000000001111111; // input=6.90625, output=0.998999495599
			9'd222: expected_data_function = 16'b0000000001111111; // input=6.9375, output=0.999030248032
			9'd223: expected_data_function = 16'b0000000001111111; // input=6.96875, output=0.999060056119
			9'd224: expected_data_function = 16'b0000000001111111; // input=7.0, output=0.999088948806
			9'd225: expected_data_function = 16'b0000000001111111; // input=7.03125, output=0.999116954152
			9'd226: expected_data_function = 16'b0000000001111111; // input=7.0625, output=0.999144099363
			9'd227: expected_data_function = 16'b0000000001111111; // input=7.09375, output=0.999170410812
			9'd228: expected_data_function = 16'b0000000001111111; // input=7.125, output=0.999195914064
			9'd229: expected_data_function = 16'b0000000001111111; // input=7.15625, output=0.999220633907
			9'd230: expected_data_function = 16'b0000000001111111; // input=7.1875, output=0.999244594367
			9'd231: expected_data_function = 16'b0000000001111111; // input=7.21875, output=0.999267818738
			9'd232: expected_data_function = 16'b0000000001111111; // input=7.25, output=0.999290329601
			9'd233: expected_data_function = 16'b0000000001111111; // input=7.28125, output=0.999312148845
			9'd234: expected_data_function = 16'b0000000001111111; // input=7.3125, output=0.999333297691
			9'd235: expected_data_function = 16'b0000000001111111; // input=7.34375, output=0.999353796709
			9'd236: expected_data_function = 16'b0000000001111111; // input=7.375, output=0.999373665842
			9'd237: expected_data_function = 16'b0000000001111111; // input=7.40625, output=0.99939292442
			9'd238: expected_data_function = 16'b0000000001111111; // input=7.4375, output=0.999411591181
			9'd239: expected_data_function = 16'b0000000001111111; // input=7.46875, output=0.999429684293
			9'd240: expected_data_function = 16'b0000000001111111; // input=7.5, output=0.999447221363
			9'd241: expected_data_function = 16'b0000000001111111; // input=7.53125, output=0.999464219462
			9'd242: expected_data_function = 16'b0000000001111111; // input=7.5625, output=0.999480695136
			9'd243: expected_data_function = 16'b0000000001111111; // input=7.59375, output=0.999496664425
			9'd244: expected_data_function = 16'b0000000001111111; // input=7.625, output=0.999512142877
			9'd245: expected_data_function = 16'b0000000001111111; // input=7.65625, output=0.999527145565
			9'd246: expected_data_function = 16'b0000000001111111; // input=7.6875, output=0.999541687099
			9'd247: expected_data_function = 16'b0000000001111111; // input=7.71875, output=0.999555781641
			9'd248: expected_data_function = 16'b0000000001111111; // input=7.75, output=0.999569442919
			9'd249: expected_data_function = 16'b0000000001111111; // input=7.78125, output=0.999582684239
			9'd250: expected_data_function = 16'b0000000001111111; // input=7.8125, output=0.999595518502
			9'd251: expected_data_function = 16'b0000000001111111; // input=7.84375, output=0.999607958211
			9'd252: expected_data_function = 16'b0000000001111111; // input=7.875, output=0.999620015485
			9'd253: expected_data_function = 16'b0000000001111111; // input=7.90625, output=0.999631702074
			9'd254: expected_data_function = 16'b0000000001111111; // input=7.9375, output=0.999643029365
			9'd255: expected_data_function = 16'b0000000001111111; // input=7.96875, output=0.999654008397
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
    $display ("Testing sigmoid");
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

