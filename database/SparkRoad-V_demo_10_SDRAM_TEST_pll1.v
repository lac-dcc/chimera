

`timescale 1 ns /  100 fs 
module pll1 (
	inclk0,
	reset,
	c0,
	c1,
	c2,
	c3,
	c4,
	ext_lock
	);

input inclk0,reset;
output ext_lock;
output c0;
output c1;
output c2;
output c3;
output c4;


wire [4:0] clkc;
wire [2:0] dummy;

    EG_LOGIC_BUFG  pll_c0(.o(c0),.i(clkc[0]));
    EG_LOGIC_BUFG  pll_c1(.o(c1),.i(clkc[1]));
    EG_LOGIC_BUFG  pll_c2(.o(c2),.i(clkc[2]));
    EG_LOGIC_BUFG  pll_c3(.o(c3),.i(clkc[3]));
    EG_LOGIC_BUFG  pll_c4(.o(c4),.i(clkc[4]));

//assign c0 = clkc[0] ;
//assign c1 = clkc[1] ;
//assign c2 = clkc[2] ;
//assign c3 = clkc[3] ;
//assign c4 = clkc[4] ;

EG_PHY_PLL  pll_clk (.refclk(inclk0),
                     .reset(reset),
			    .stdby(1'b0),
                     .clkc(clkc),
                     .extlock(ext_lock)

				);  
defparam pll_clk.FBCLK_DIV = 45;  //input 50M, vco = 1000M
defparam pll_clk.CLKC0_DIV = 8;   //c0 = 133M
defparam pll_clk.CLKC1_DIV = 8;    //c1 = 125M
defparam pll_clk.CLKC2_DIV = 8;    //c2 = 125M
defparam pll_clk.CLKC3_DIV = 8;    //c3 = C0
defparam pll_clk.CLKC4_DIV = 8;    //c4 = 125M    300M�����漸��û������

defparam pll_clk.CLKC0_ENABLE = "ENABLE";   //  ENABLE/DISABLE/SIGNAL
defparam pll_clk.CLKC1_ENABLE = "ENABLE";   //  ENABLE/DISABLE/SIGNAL
defparam pll_clk.CLKC2_ENABLE = "DISABLE";   // ENABLE/DISABLE/SIGNAL
defparam pll_clk.CLKC3_ENABLE = "DISABLE";  //  ENABLE/DISABLE/SIGNAL
defparam pll_clk.CLKC4_ENABLE = "DISABLE";  //  ENABLE/DISABLE/SIGNAL

//corse 
defparam pll_clk.CLKC0_CPHASE = 6;    //  1-127  ,CLKC0_CPHASE < CLKC0_DIV
defparam pll_clk.CLKC1_CPHASE = 0;     //  1-127  ,CLKC1_CPHASE < CLKC1_DIV
defparam pll_clk.CLKC2_CPHASE = 4;     //  1-127  ,CLKC2_CPHASE < CLKC2_DIV
defparam pll_clk.CLKC3_CPHASE = 2;     //  1-127  ,CLKC3_CPHASE < CLKC3_DIV
defparam pll_clk.CLKC4_CPHASE = 0;     //  1-127  ,CLKC4_CPHASE < CLKC4_DIV

//fast
defparam pll0_clk.CLKC0_FPHASE   = "5";    //  0-7
defparam pll0_clk.CLKC1_FPHASE   = "0";    //  0-7
defparam pll0_clk.CLKC2_FPHASE   = "7";    //  0-7
defparam pll0_clk.CLKC3_FPHASE   = "7";    //  0-7
defparam pll0_clk.CLKC4_FPHASE   = "0";    //  0-7

endmodule
