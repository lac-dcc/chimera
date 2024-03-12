module RS_D_MUX(RS_D_Sel,RD1,RF_WD_E,RF_WD_M,RF_WD_W,RS_D);
//input
    input [31:0] RS_D_Sel;

    input [31:0] RD1;
    input [31:0] RF_WD_E;
    input [31:0] RF_WD_M;
    input [31:0] RF_WD_W;

//output
    output reg [31:0] RS_D;

//logic
    parameter E=1,
              M=2,
              W=3;

    always @(*)
        begin
            RS_D=RD1;
            case(RS_D_Sel)
                E:RS_D=RF_WD_E;
                M:RS_D=RF_WD_M;
                W:RS_D=RF_WD_W;
            endcase
        end

endmodule

module RT_D_MUX(RT_D_Sel,RD2,RF_WD_E,RF_WD_M,RF_WD_W,RT_D);
//input
    input [31:0] RT_D_Sel;

    input [31:0] RD2;
    input [31:0] RF_WD_E;
    input [31:0] RF_WD_M;
    input [31:0] RF_WD_W;

//output
    output reg [31:0] RT_D;

//logic
    parameter E=1,
              M=2,
              W=3;

    always @(*)
        begin
            RT_D=RD2;
            case(RT_D_Sel)
                E:RT_D=RF_WD_E;
                M:RT_D=RF_WD_M;
                W:RT_D=RF_WD_W;
            endcase
        end

endmodule

module RS_E_MUX(RS_E_Sel,V1_E,RF_WD_M,RF_WD_W,RS_E);
//input
    input [31:0] RS_E_Sel;

    input [31:0] V1_E;
    input [31:0] RF_WD_M;
    input [31:0] RF_WD_W;

//output
    output reg [31:0] RS_E;

//logic
    parameter E=1,
              M=2,
              W=3;

    always @(*)
        begin
            RS_E=V1_E;
            case(RS_E_Sel)
                M:RS_E=RF_WD_M;
                W:RS_E=RF_WD_W;
            endcase
        end

endmodule

module RT_E_MUX(RT_E_Sel,V2_E,RF_WD_M,RF_WD_W,RT_E);
//input
    input [31:0] RT_E_Sel;

    input [31:0] V2_E;
    input [31:0] RF_WD_M;
    input [31:0] RF_WD_W;

//output
    output reg [31:0] RT_E;

//logic
    parameter E=1,
              M=2,
              W=3;

    always @(*)
        begin
            RT_E=V2_E;
            case(RT_E_Sel)
                M:RT_E=RF_WD_M;
                W:RT_E=RF_WD_W;
            endcase
        end

endmodule

module RS_M_MUX(RS_M_Sel,V1_M,RF_WD_W,RS_M);
//input
    input [31:0] RS_M_Sel;

    input [31:0] V1_M;
    input [31:0] RF_WD_W;

//output
    output reg [31:0] RS_M;

//logic
    parameter E=1,
              M=2,
              W=3;

    always @(*)
        begin
            RS_M=V1_M;
            case(RS_M_Sel)
                W:RS_M=RF_WD_W;
            endcase
        end

endmodule

module RT_M_MUX(RT_M_Sel,V2_M,RF_WD_W,RT_M);
//input
    input [31:0] RT_M_Sel;

    input [31:0] V2_M;
    input [31:0] RF_WD_W;

//output
    output reg [31:0] RT_M;

//logic
    parameter E=1,
              M=2,
              W=3;

    always @(*)
        begin
            RT_M=V2_M;
            case(RT_M_Sel)
                W:RT_M=RF_WD_W;
            endcase
        end

endmodule
