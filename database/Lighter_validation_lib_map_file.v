// This program was cloned from: https://github.com/AUCOHL/Lighter
// License: Apache License 2.0

module \$adffe (ARST, CLK, D, EN, Q);
    parameter ARST_POLARITY =1'b1;
    parameter ARST_VALUE  =1'b0;
    parameter CLK_POLARITY =1'b1;
    parameter EN_POLARITY =1'b1;
    parameter WIDTH =1;

    input ARST, CLK, EN;
    input [WIDTH -1 :0] D; 
    output [WIDTH -1 :0] Q;

    wire GCLK;

    generate
        if (WIDTH < 5) begin
                sky130_fd_sc_hd__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else if (WIDTH < 17) begin
                sky130_fd_sc_hd__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else begin
                sky130_fd_sc_hd__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
        end
    endgenerate

    $adff  #( 
            .WIDTH(WIDTH), 
            .CLK_POLARITY(CLK_POLARITY),
            .ARST_VALUE(ARST_VALUE) ,
            .ARST_POLARITY (ARST_POLARITY)
            ) 
            flipflop(  
            .CLK(GCLK), 
            .ARST(ARST),
            .D(D), 
            .Q(Q)
            );
endmodule

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

module \$dffe ( CLK, D, EN, Q);
    parameter CLK_POLARITY =1'b1;
    parameter EN_POLARITY =1'b1;
    parameter WIDTH =1;

    input  CLK, EN;
    input [WIDTH -1:0] D; 
    output [WIDTH -1:0] Q;

    wire GCLK;

    generate
        if (WIDTH < 5) begin
                sky130_fd_sc_hd__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else if (WIDTH < 17) begin
                sky130_fd_sc_hd__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else begin
                sky130_fd_sc_hd__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
        end
    endgenerate

    $dff  #( 
            .WIDTH(WIDTH), 
            .CLK_POLARITY(CLK_POLARITY),
            ) 
            flipflop(  
            .CLK(GCLK), 
            .D(D), 
            .Q(Q)
            );
endmodule

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

module \$dffsre ( CLK, EN, CLR, SET, D, Q);
    parameter CLK_POLARITY =1'b1;
    parameter EN_POLARITY =1'b1;
    parameter CLR_POLARITY =1'b1;
    parameter SET_POLARITY =1'b1;
    parameter WIDTH =1;

    input  CLK, EN, CLR, SET;
    input [WIDTH -1:0] D; 
    output [WIDTH -1:0] Q;

    wire GCLK;

    generate
        if (WIDTH < 5) begin
                sky130_fd_sc_hd__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else if (WIDTH < 17) begin
                sky130_fd_sc_hd__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else begin
                sky130_fd_sc_hd__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
        end
    endgenerate

    $dffsr  #( 
            .WIDTH(WIDTH), 
            .CLK_POLARITY(CLK_POLARITY),
            .CLR_POLARITY(CLR_POLARITY), 
            .SET_POLARITY(SET_POLARITY)
            ) 
            flipflop(  
            .CLK(GCLK), 
            .CLR(CLR),
            .SET(SET),
            .D(D), 
            .Q(Q)
            );
endmodule

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////


module \$aldffe ( CLK, EN, ALOAD, AD, D, Q);
    parameter CLK_POLARITY =1'b1;
    parameter EN_POLARITY =1'b1;
    parameter ALOAD_POLARITY =1'b1;
    parameter WIDTH =1;

    input  CLK, EN, ALOAD;
    input [WIDTH -1:0] D; 
    input [WIDTH-1:0] AD;
    output [WIDTH -1:0] Q;

    wire GCLK;

    generate
        if (WIDTH < 5) begin
                sky130_fd_sc_hd__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else if (WIDTH < 17) begin
                sky130_fd_sc_hd__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else begin
                sky130_fd_sc_hd__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
        end
    endgenerate

    $aldff  #( 
            .WIDTH(WIDTH), 
            .CLK_POLARITY(CLK_POLARITY),
            .ALOAD_POLARITY(ALOAD_POLARITY), 
            ) 
            flipflop(  
            .CLK(GCLK), 
            .D(D),
            .AD(AD),
            .Q(Q)
            );
endmodule

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

//$sdffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b0),
// .SRST_VALUE(2'h2), .WIDTH(2)) ff1 (.CLK(CLK), .SRST(1'b0), .EN(EN), .D(D), .Q(Q[3:2]));
// issue and disable


//module \$sdffe ( CLK, EN, SRST, D, Q);
//    parameter CLK_POLARITY =1'b1;
//    parameter EN_POLARITY =1'b1;
//    parameter SRST_POLARITY =1'b1;
//    parameter SRST_VALUE =1'b1;
//    parameter WIDTH =1;


//    input  CLK, EN, SRST;
//    input [WIDTH -1:0] D; 
//    output [WIDTH -1:0] Q;

//    wire GCLK;

//    generate
//            if (WIDTH < 5) begin
//                    sky130_fd_sc_hd__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
//                    end
//                else if (WIDTH < 17) begin
//                    sky130_fd_sc_hd__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
//                    end
//                else begin
//                    sky130_fd_sc_hd__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
//            end
//        endgenerate


//    $sdff  #( 
//            .WIDTH(WIDTH), 
//            .CLK_POLARITY(CLK_POLARITY),
//            .SRST_POLARITY(SRST_POLARITY), 
//            .SRST_VALUE(SRST_VALUE)
//            ) 
//            flipflop(  
//            .CLK(GCLK), 
//            .SRST(SRST),
//            .D(D), 
//            .Q(Q)
//            );
//endmodule



module \$sdffce ( CLK, EN, SRST, D, Q);
    parameter CLK_POLARITY =1'b1;
    parameter EN_POLARITY =1'b1;
    parameter SRST_POLARITY =1'b1;
    parameter SRST_VALUE =1'b1;
    parameter WIDTH =1;

    input  CLK, EN, SRST;
    input [WIDTH -1:0] D; 
    output [WIDTH -1:0] Q;

    wire GCLK;

    generate
        if (WIDTH < 5) begin
                sky130_fd_sc_hd__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else if (WIDTH < 17) begin
                sky130_fd_sc_hd__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else begin
                sky130_fd_sc_hd__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
        end
    endgenerate

    $sdff  #( 
            .WIDTH(WIDTH), 
            .CLK_POLARITY(CLK_POLARITY),
            .SRST_POLARITY(SRST_POLARITY), 
            .SRST_VALUE(SRST_VALUE)
            ) 
            flipflop(  
            .CLK(GCLK), 
            .SRST(SRST),
            .D(D), 
            .Q(Q)
            );
endmodule



	//RTLIL::Cell* addSr    (RTLIL::IdString name, const RTLIL::SigSpec &sig_set, const RTLIL::SigSpec &sig_clr, const RTLIL::SigSpec &sig_q, bool set_polarity = true, bool clr_polarity = true, const std::string &src = "");
	
    //RTLIL::Cell* addFf    (RTLIL::IdString name, const RTLIL::SigSpec &sig_d, const RTLIL::SigSpec &sig_q, const std::string &src = "");
	//RTLIL::Cell* addDff   (RTLIL::IdString name, const RTLIL::SigSpec &sig_clk, const RTLIL::SigSpec &sig_d,   const RTLIL::SigSpec &sig_q, bool clk_polarity = true, const std::string &src = "");
	//RTLIL::Cell* addDffe  (RTLIL::IdString name, const RTLIL::SigSpec &sig_clk, const RTLIL::SigSpec &sig_en,  const RTLIL::SigSpec &sig_d, const RTLIL::SigSpec &sig_q, bool clk_polarity = true, bool en_polarity = true, const std::string &src = "");
	
    //RTLIL::Cell* addDffsr (RTLIL::IdString name, const RTLIL::SigSpec &sig_clk, const RTLIL::SigSpec &sig_set, const RTLIL::SigSpec &sig_clr, RTLIL::SigSpec sig_d, const RTLIL::SigSpec &sig_q, bool clk_polarity = true, bool set_polarity = true, bool clr_polarity = true, const std::string &src = "");
	//RTLIL::Cell* addDffsre (RTLIL::IdString name, const RTLIL::SigSpec &sig_clk, const RTLIL::SigSpec &sig_en, const RTLIL::SigSpec &sig_set, const RTLIL::SigSpec &sig_clr, RTLIL::SigSpec sig_d, const RTLIL::SigSpec &sig_q, bool clk_polarity = true, bool en_polarity = true, bool set_polarity = true, bool clr_polarity = true, const std::string &src = "");
	
    //RTLIL::Cell* addAdff (RTLIL::IdString name, const RTLIL::SigSpec &sig_clk, const RTLIL::SigSpec &sig_arst, const RTLIL::SigSpec &sig_d, const RTLIL::SigSpec &sig_q, RTLIL::Const arst_value, bool clk_polarity = true, bool arst_polarity = true, const std::string &src = "");
	//RTLIL::Cell* addAdffe (RTLIL::IdString name, const RTLIL::SigSpec &sig_clk, const RTLIL::SigSpec &sig_en, const RTLIL::SigSpec &sig_arst,  const RTLIL::SigSpec &sig_d, const RTLIL::SigSpec &sig_q, RTLIL::Const arst_value, bool clk_polarity = true, bool en_polarity = true, bool arst_polarity = true, const std::string &src = "");
	
    //RTLIL::Cell* addAldff (RTLIL::IdString name, const RTLIL::SigSpec &sig_clk, const RTLIL::SigSpec &sig_aload, const RTLIL::SigSpec &sig_d, const RTLIL::SigSpec &sig_q, const RTLIL::SigSpec &sig_ad, bool clk_polarity = true, bool aload_polarity = true, const std::string &src = "");
	//RTLIL::Cell* addAldffe (RTLIL::IdString name, const RTLIL::SigSpec &sig_clk, const RTLIL::SigSpec &sig_en, const RTLIL::SigSpec &sig_aload,  const RTLIL::SigSpec &sig_d, const RTLIL::SigSpec &sig_q, const RTLIL::SigSpec &sig_ad, bool clk_polarity = true, bool en_polarity = true, bool aload_polarity = true, const std::string &src = "");
	
    //RTLIL::Cell* addSdff (RTLIL::IdString name, const RTLIL::SigSpec &sig_clk, const RTLIL::SigSpec &sig_srst, const RTLIL::SigSpec &sig_d, const RTLIL::SigSpec &sig_q, RTLIL::Const srst_value, bool clk_polarity = true, bool srst_polarity = true, const std::string &src = "");
	//RTLIL::Cell* addSdffe (RTLIL::IdString name, const RTLIL::SigSpec &sig_clk, const RTLIL::SigSpec &sig_en, const RTLIL::SigSpec &sig_srst,  const RTLIL::SigSpec &sig_d, const RTLIL::SigSpec &sig_q, RTLIL::Const srst_value, bool clk_polarity = true, bool en_polarity = true, bool srst_polarity = true, const std::string &src = "");
	
    
    
    //RTLIL::Cell* addSdffce (RTLIL::IdString name, const RTLIL::SigSpec &sig_clk, const RTLIL::SigSpec &sig_en, const RTLIL::SigSpec &sig_srst, const RTLIL::SigSpec &sig_d, const RTLIL::SigSpec &sig_q, RTLIL::Const srst_value, bool clk_polarity = true, bool en_polarity = true, bool srst_polarity = true, const std::string &src = "");
	//RTLIL::Cell* addDlatch (RTLIL::IdString name, const RTLIL::SigSpec &sig_en, const RTLIL::SigSpec &sig_d, const RTLIL::SigSpec &sig_q, bool en_polarity = true, const std::string &src = "");
	//RTLIL::Cell* addAdlatch (RTLIL::IdString name, const RTLIL::SigSpec &sig_en, const RTLIL::SigSpec &sig_arst, const RTLIL::SigSpec &sig_d, const RTLIL::SigSpec &sig_q, RTLIL::Const arst_value, bool en_polarity = true, bool arst_polarity = true, const std::string &src = "");
	//RTLIL::Cell* addDlatchsr (RTLIL::IdString name, const RTLIL::SigSpec &sig_en, const RTLIL::SigSpec &sig_set, const RTLIL::SigSpec &sig_clr, RTLIL::SigSpec sig_d, const RTLIL::SigSpec &sig_q, bool en_polarity = true, bool set_polarity = true, bool clr_polarity = true, const std::string &src = "");



