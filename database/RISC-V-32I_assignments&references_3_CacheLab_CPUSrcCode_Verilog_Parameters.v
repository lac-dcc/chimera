//0: SLL 1:SRL 2:SRA 3:ADD 4:SUB 5:XOR 6:OR 7:AND 8:SLT 9:SLTU 10:BEQ 11:BNE 12:BLT 13:BLTU 14:BGE 15:BGEU
    localparam SLL = 5'd0;
    localparam SRL = 5'd1;
    localparam SRA = 5'd2;
    localparam ADD = 5'd3;
    localparam SUB = 5'd4;
    localparam XOR = 5'd5;
    localparam OR = 5'd6;
    localparam AND = 5'd7;
    localparam SLT = 5'd8;
    localparam SLTU = 5'd9;
    localparam BEQ = 5'd10;
    localparam BNE = 5'd11;
    localparam BLT = 5'd12;
    localparam BLTU = 5'd13;
    localparam BGE = 5'd14;
    localparam BGEU = 5'd15;
    localparam LUI = 5'd16;
    // 0:I 1:S 2:B 3:U 4:J
    localparam ITYPE = 5'd0;
    localparam STYPE = 5'd1;
    localparam BTYPE = 5'd2;
    localparam UTYPE = 5'd3;
    localparam JTYPE = 5'd4;  
    //0:不写入 1:8bit符号拓展后写入 2:16bit符号拓展后写入 3:32bit直接写入 4:8bit无符号拓展写入 5:16bit无符号拓展写入
    localparam NOREGWRITE = 5'b0;
    localparam LB = 5'd1;
    localparam LH = 5'd2;
    localparam LW = 5'd3;
    localparam LBU = 5'd4;
    localparam LHU = 5'd5;   
