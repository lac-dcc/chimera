// This program was cloned from: https://github.com/jotego/jt12
// License: GNU General Public License v3.0

module adpcma_single(
    input                 clk,        // CPU clock
    input         [ 3:0]  data,
    output signed [15:0]  pcm
);

reg [11:0] lut[0:391];

integer x=0, next_x;
reg [5:0] step=0, step_next, step_1p;
reg [8:0] addr;
reg [11:0] inc;
reg sign;

always @(*) begin
    casez( data[2:0] )
        3'b0??: step_next = step=='d0 ? 6'd0 : (step-1);
        3'b100: step_next = step+2;
        3'b101: step_next = step+5;
        3'b110: step_next = step+7;
        3'b111: step_next = step+9;
    endcase
    addr = {step,data[2:0]};
    sign = data[3];
    inc = lut[addr];
    step_1p = step_next > 6'd48 ? 6'd48 : step_next;
    next_x = sign ? (x - inc) : (x + inc);
end

assign pcm = x[15:0];

integer file, file2, cnt=0;
initial begin
    file=$fopen("single.dec","w");
    file2=$fopen("single.val","w");
    $fwrite(file,"dimension single(1)\n");
end


always @(posedge clk) begin
    step <= step_1p;
    x <= next_x;
    cnt <= cnt+1;
    $fwrite( file, "single[%4x] = %1d // data = %x\n", cnt+32'h2b1b00, x, data );
    $fwrite( file2, "%d\n", x );
end

initial begin
lut[9'o00_0] = 12'd0002; lut[9'o00_1] = 12'd0006; lut[9'o00_2] = 12'd0012; lut[9'o00_3] = 12'd0016; 
lut[9'o00_4] = 12'd0022; lut[9'o00_5] = 12'd0026; lut[9'o00_6] = 12'd0032; lut[9'o00_7] = 12'd0036; 
lut[9'o01_0] = 12'd0002; lut[9'o01_1] = 12'd0006; lut[9'o01_2] = 12'd0012; lut[9'o01_3] = 12'd0016; 
lut[9'o01_4] = 12'd0023; lut[9'o01_5] = 12'd0027; lut[9'o01_6] = 12'd0033; lut[9'o01_7] = 12'd0037; 
lut[9'o02_0] = 12'd0002; lut[9'o02_1] = 12'd0007; lut[9'o02_2] = 12'd0013; lut[9'o02_3] = 12'd0020; 
lut[9'o02_4] = 12'd0025; lut[9'o02_5] = 12'd0032; lut[9'o02_6] = 12'd0036; lut[9'o02_7] = 12'd0043; 
lut[9'o03_0] = 12'd0002; lut[9'o03_1] = 12'd0007; lut[9'o03_2] = 12'd0015; lut[9'o03_3] = 12'd0022; 
lut[9'o03_4] = 12'd0027; lut[9'o03_5] = 12'd0034; lut[9'o03_6] = 12'd0042; lut[9'o03_7] = 12'd0047; 
lut[9'o04_0] = 12'd0002; lut[9'o04_1] = 12'd0010; lut[9'o04_2] = 12'd0016; lut[9'o04_3] = 12'd0024; 
lut[9'o04_4] = 12'd0031; lut[9'o04_5] = 12'd0037; lut[9'o04_6] = 12'd0045; lut[9'o04_7] = 12'd0053; 
lut[9'o05_0] = 12'd0003; lut[9'o05_1] = 12'd0011; lut[9'o05_2] = 12'd0017; lut[9'o05_3] = 12'd0025; 
lut[9'o05_4] = 12'd0034; lut[9'o05_5] = 12'd0042; lut[9'o05_6] = 12'd0050; lut[9'o05_7] = 12'd0056; 
lut[9'o06_0] = 12'd0003; lut[9'o06_1] = 12'd0012; lut[9'o06_2] = 12'd0021; lut[9'o06_3] = 12'd0030; 
lut[9'o06_4] = 12'd0037; lut[9'o06_5] = 12'd0046; lut[9'o06_6] = 12'd0055; lut[9'o06_7] = 12'd0064; 
lut[9'o07_0] = 12'd0003; lut[9'o07_1] = 12'd0013; lut[9'o07_2] = 12'd0023; lut[9'o07_3] = 12'd0033; 
lut[9'o07_4] = 12'd0042; lut[9'o07_5] = 12'd0052; lut[9'o07_6] = 12'd0062; lut[9'o07_7] = 12'd0072; 
lut[9'o10_0] = 12'd0004; lut[9'o10_1] = 12'd0014; lut[9'o10_2] = 12'd0025; lut[9'o10_3] = 12'd0035; 
lut[9'o10_4] = 12'd0046; lut[9'o10_5] = 12'd0056; lut[9'o10_6] = 12'd0067; lut[9'o10_7] = 12'd0077; 
lut[9'o11_0] = 12'd0004; lut[9'o11_1] = 12'd0015; lut[9'o11_2] = 12'd0027; lut[9'o11_3] = 12'd0040; 
lut[9'o11_4] = 12'd0051; lut[9'o11_5] = 12'd0062; lut[9'o11_6] = 12'd0074; lut[9'o11_7] = 12'd0105; 
lut[9'o12_0] = 12'd0005; lut[9'o12_1] = 12'd0017; lut[9'o12_2] = 12'd0031; lut[9'o12_3] = 12'd0043; 
lut[9'o12_4] = 12'd0056; lut[9'o12_5] = 12'd0070; lut[9'o12_6] = 12'd0102; lut[9'o12_7] = 12'd0114; 
lut[9'o13_0] = 12'd0005; lut[9'o13_1] = 12'd0020; lut[9'o13_2] = 12'd0034; lut[9'o13_3] = 12'd0047; 
lut[9'o13_4] = 12'd0062; lut[9'o13_5] = 12'd0075; lut[9'o13_6] = 12'd0111; lut[9'o13_7] = 12'd0124; 
lut[9'o14_0] = 12'd0006; lut[9'o14_1] = 12'd0022; lut[9'o14_2] = 12'd0037; lut[9'o14_3] = 12'd0053; 
lut[9'o14_4] = 12'd0070; lut[9'o14_5] = 12'd0104; lut[9'o14_6] = 12'd0121; lut[9'o14_7] = 12'd0135; 
lut[9'o15_0] = 12'd0006; lut[9'o15_1] = 12'd0024; lut[9'o15_2] = 12'd0042; lut[9'o15_3] = 12'd0060; 
lut[9'o15_4] = 12'd0075; lut[9'o15_5] = 12'd0113; lut[9'o15_6] = 12'd0131; lut[9'o15_7] = 12'd0147; 
lut[9'o16_0] = 12'd0007; lut[9'o16_1] = 12'd0026; lut[9'o16_2] = 12'd0045; lut[9'o16_3] = 12'd0064; 
lut[9'o16_4] = 12'd0103; lut[9'o16_5] = 12'd0122; lut[9'o16_6] = 12'd0141; lut[9'o16_7] = 12'd0160; 
lut[9'o17_0] = 12'd0010; lut[9'o17_1] = 12'd0030; lut[9'o17_2] = 12'd0051; lut[9'o17_3] = 12'd0071; 
lut[9'o17_4] = 12'd0112; lut[9'o17_5] = 12'd0132; lut[9'o17_6] = 12'd0153; lut[9'o17_7] = 12'd0173; 
lut[9'o20_0] = 12'd0011; lut[9'o20_1] = 12'd0033; lut[9'o20_2] = 12'd0055; lut[9'o20_3] = 12'd0077; 
lut[9'o20_4] = 12'd0122; lut[9'o20_5] = 12'd0144; lut[9'o20_6] = 12'd0166; lut[9'o20_7] = 12'd0210; 
lut[9'o21_0] = 12'd0012; lut[9'o21_1] = 12'd0036; lut[9'o21_2] = 12'd0062; lut[9'o21_3] = 12'd0106; 
lut[9'o21_4] = 12'd0132; lut[9'o21_5] = 12'd0156; lut[9'o21_6] = 12'd0202; lut[9'o21_7] = 12'd0226; 
lut[9'o22_0] = 12'd0013; lut[9'o22_1] = 12'd0041; lut[9'o22_2] = 12'd0067; lut[9'o22_3] = 12'd0115; 
lut[9'o22_4] = 12'd0143; lut[9'o22_5] = 12'd0171; lut[9'o22_6] = 12'd0217; lut[9'o22_7] = 12'd0245; 
lut[9'o23_0] = 12'd0014; lut[9'o23_1] = 12'd0044; lut[9'o23_2] = 12'd0074; lut[9'o23_3] = 12'd0124; 
lut[9'o23_4] = 12'd0155; lut[9'o23_5] = 12'd0205; lut[9'o23_6] = 12'd0235; lut[9'o23_7] = 12'd0265; 
lut[9'o24_0] = 12'd0015; lut[9'o24_1] = 12'd0050; lut[9'o24_2] = 12'd0102; lut[9'o24_3] = 12'd0135; 
lut[9'o24_4] = 12'd0170; lut[9'o24_5] = 12'd0223; lut[9'o24_6] = 12'd0255; lut[9'o24_7] = 12'd0310; 
lut[9'o25_0] = 12'd0016; lut[9'o25_1] = 12'd0054; lut[9'o25_2] = 12'd0111; lut[9'o25_3] = 12'd0147; 
lut[9'o25_4] = 12'd0204; lut[9'o25_5] = 12'd0242; lut[9'o25_6] = 12'd0277; lut[9'o25_7] = 12'd0335; 
lut[9'o26_0] = 12'd0020; lut[9'o26_1] = 12'd0060; lut[9'o26_2] = 12'd0121; lut[9'o26_3] = 12'd0161; 
lut[9'o26_4] = 12'd0222; lut[9'o26_5] = 12'd0262; lut[9'o26_6] = 12'd0323; lut[9'o26_7] = 12'd0363; 
lut[9'o27_0] = 12'd0021; lut[9'o27_1] = 12'd0065; lut[9'o27_2] = 12'd0131; lut[9'o27_3] = 12'd0175; 
lut[9'o27_4] = 12'd0240; lut[9'o27_5] = 12'd0304; lut[9'o27_6] = 12'd0350; lut[9'o27_7] = 12'd0414; 
lut[9'o30_0] = 12'd0023; lut[9'o30_1] = 12'd0072; lut[9'o30_2] = 12'd0142; lut[9'o30_3] = 12'd0211; 
lut[9'o30_4] = 12'd0260; lut[9'o30_5] = 12'd0327; lut[9'o30_6] = 12'd0377; lut[9'o30_7] = 12'd0446; 
lut[9'o31_0] = 12'd0025; lut[9'o31_1] = 12'd0100; lut[9'o31_2] = 12'd0154; lut[9'o31_3] = 12'd0227; 
lut[9'o31_4] = 12'd0302; lut[9'o31_5] = 12'd0355; lut[9'o31_6] = 12'd0431; lut[9'o31_7] = 12'd0504; 
lut[9'o32_0] = 12'd0027; lut[9'o32_1] = 12'd0107; lut[9'o32_2] = 12'd0166; lut[9'o32_3] = 12'd0246; 
lut[9'o32_4] = 12'd0325; lut[9'o32_5] = 12'd0405; lut[9'o32_6] = 12'd0464; lut[9'o32_7] = 12'd0544; 
lut[9'o33_0] = 12'd0032; lut[9'o33_1] = 12'd0116; lut[9'o33_2] = 12'd0202; lut[9'o33_3] = 12'd0266; 
lut[9'o33_4] = 12'd0353; lut[9'o33_5] = 12'd0437; lut[9'o33_6] = 12'd0523; lut[9'o33_7] = 12'd0607; 
lut[9'o34_0] = 12'd0034; lut[9'o34_1] = 12'd0126; lut[9'o34_2] = 12'd0217; lut[9'o34_3] = 12'd0311; 
lut[9'o34_4] = 12'd0402; lut[9'o34_5] = 12'd0474; lut[9'o34_6] = 12'd0565; lut[9'o34_7] = 12'd0657; 
lut[9'o35_0] = 12'd0037; lut[9'o35_1] = 12'd0136; lut[9'o35_2] = 12'd0236; lut[9'o35_3] = 12'd0335; 
lut[9'o35_4] = 12'd0434; lut[9'o35_5] = 12'd0533; lut[9'o35_6] = 12'd0633; lut[9'o35_7] = 12'd0732; 
lut[9'o36_0] = 12'd0042; lut[9'o36_1] = 12'd0150; lut[9'o36_2] = 12'd0256; lut[9'o36_3] = 12'd0364; 
lut[9'o36_4] = 12'd0471; lut[9'o36_5] = 12'd0577; lut[9'o36_6] = 12'd0705; lut[9'o36_7] = 12'd1013; 
lut[9'o37_0] = 12'd0046; lut[9'o37_1] = 12'd0163; lut[9'o37_2] = 12'd0277; lut[9'o37_3] = 12'd0414; 
lut[9'o37_4] = 12'd0531; lut[9'o37_5] = 12'd0646; lut[9'o37_6] = 12'd0762; lut[9'o37_7] = 12'd1077; 
lut[9'o40_0] = 12'd0052; lut[9'o40_1] = 12'd0176; lut[9'o40_2] = 12'd0322; lut[9'o40_3] = 12'd0446; 
lut[9'o40_4] = 12'd0573; lut[9'o40_5] = 12'd0717; lut[9'o40_6] = 12'd1043; lut[9'o40_7] = 12'd1167; 
lut[9'o41_0] = 12'd0056; lut[9'o41_1] = 12'd0213; lut[9'o41_2] = 12'd0347; lut[9'o41_3] = 12'd0504; 
lut[9'o41_4] = 12'd0641; lut[9'o41_5] = 12'd0776; lut[9'o41_6] = 12'd1132; lut[9'o41_7] = 12'd1267; 
lut[9'o42_0] = 12'd0063; lut[9'o42_1] = 12'd0231; lut[9'o42_2] = 12'd0377; lut[9'o42_3] = 12'd0545; 
lut[9'o42_4] = 12'd0713; lut[9'o42_5] = 12'd1061; lut[9'o42_6] = 12'd1227; lut[9'o42_7] = 12'd1375; 
lut[9'o43_0] = 12'd0070; lut[9'o43_1] = 12'd0250; lut[9'o43_2] = 12'd0430; lut[9'o43_3] = 12'd0610; 
lut[9'o43_4] = 12'd0771; lut[9'o43_5] = 12'd1151; lut[9'o43_6] = 12'd1331; lut[9'o43_7] = 12'd1511; 
lut[9'o44_0] = 12'd0075; lut[9'o44_1] = 12'd0271; lut[9'o44_2] = 12'd0464; lut[9'o44_3] = 12'd0660; 
lut[9'o44_4] = 12'd1053; lut[9'o44_5] = 12'd1247; lut[9'o44_6] = 12'd1442; lut[9'o44_7] = 12'd1636; 
lut[9'o45_0] = 12'd0104; lut[9'o45_1] = 12'd0314; lut[9'o45_2] = 12'd0524; lut[9'o45_3] = 12'd0734; 
lut[9'o45_4] = 12'd1144; lut[9'o45_5] = 12'd1354; lut[9'o45_6] = 12'd1564; lut[9'o45_7] = 12'd1774; 
lut[9'o46_0] = 12'd0112; lut[9'o46_1] = 12'd0340; lut[9'o46_2] = 12'd0565; lut[9'o46_3] = 12'd1013; 
lut[9'o46_4] = 12'd1240; lut[9'o46_5] = 12'd1466; lut[9'o46_6] = 12'd1713; lut[9'o46_7] = 12'd2141; 
lut[9'o47_0] = 12'd0122; lut[9'o47_1] = 12'd0366; lut[9'o47_2] = 12'd0633; lut[9'o47_3] = 12'd1077; 
lut[9'o47_4] = 12'd1344; lut[9'o47_5] = 12'd1610; lut[9'o47_6] = 12'd2055; lut[9'o47_7] = 12'd2321; 
lut[9'o50_0] = 12'd0132; lut[9'o50_1] = 12'd0417; lut[9'o50_2] = 12'd0704; lut[9'o50_3] = 12'd1171; 
lut[9'o50_4] = 12'd1456; lut[9'o50_5] = 12'd1743; lut[9'o50_6] = 12'd2230; lut[9'o50_7] = 12'd2515; 
lut[9'o51_0] = 12'd0143; lut[9'o51_1] = 12'd0452; lut[9'o51_2] = 12'd0761; lut[9'o51_3] = 12'd1270; 
lut[9'o51_4] = 12'd1577; lut[9'o51_5] = 12'd2106; lut[9'o51_6] = 12'd2415; lut[9'o51_7] = 12'd2724; 
lut[9'o52_0] = 12'd0155; lut[9'o52_1] = 12'd0510; lut[9'o52_2] = 12'd1043; lut[9'o52_3] = 12'd1376; 
lut[9'o52_4] = 12'd1731; lut[9'o52_5] = 12'd2264; lut[9'o52_6] = 12'd2617; lut[9'o52_7] = 12'd3152; 
lut[9'o53_0] = 12'd0170; lut[9'o53_1] = 12'd0551; lut[9'o53_2] = 12'd1131; lut[9'o53_3] = 12'd1512; 
lut[9'o53_4] = 12'd2073; lut[9'o53_5] = 12'd2454; lut[9'o53_6] = 12'd3034; lut[9'o53_7] = 12'd3415; 
lut[9'o54_0] = 12'd0204; lut[9'o54_1] = 12'd0615; lut[9'o54_2] = 12'd1226; lut[9'o54_3] = 12'd1637; 
lut[9'o54_4] = 12'd2250; lut[9'o54_5] = 12'd2661; lut[9'o54_6] = 12'd3272; lut[9'o54_7] = 12'd3703; 
lut[9'o55_0] = 12'd0221; lut[9'o55_1] = 12'd0665; lut[9'o55_2] = 12'd1330; lut[9'o55_3] = 12'd1774; 
lut[9'o55_4] = 12'd2437; lut[9'o55_5] = 12'd3103; lut[9'o55_6] = 12'd3546; lut[9'o55_7] = 12'd3777; 
lut[9'o56_0] = 12'd0240; lut[9'o56_1] = 12'd0740; lut[9'o56_2] = 12'd1441; lut[9'o56_3] = 12'd2141; 
lut[9'o56_4] = 12'd2642; lut[9'o56_5] = 12'd3342; lut[9'o56_6] = 12'd3777; lut[9'o56_7] = 12'd3777; 
lut[9'o57_0] = 12'd0260; lut[9'o57_1] = 12'd1021; lut[9'o57_2] = 12'd1561; lut[9'o57_3] = 12'd2322; 
lut[9'o57_4] = 12'd3063; lut[9'o57_5] = 12'd3624; lut[9'o57_6] = 12'd3777; lut[9'o57_7] = 12'd3777; 
lut[9'o60_0] = 12'd0302; lut[9'o60_1] = 12'd1106; lut[9'o60_2] = 12'd1712; lut[9'o60_3] = 12'd2516; 
lut[9'o60_4] = 12'd3322; lut[9'o60_5] = 12'd3777; lut[9'o60_6] = 12'd3777; lut[9'o60_7] = 12'd3777; 
end


endmodule // adpcma_single