`timescale  1 ps / 1 ps
module glbl ();
    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    //SuppressWarnings VEditor - this value is used in other modules through global reference
    wire GSR;
    //SuppressWarnings VEditor - this value is used in other modules through global reference
    wire GTS;
    //SuppressWarnings VEditor - this value is used in other modules through global reference
    wire PRLD;
    //SuppressWarnings VEditor - this value is used in other modules through global reference
    wire PLL_LOCKG;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	   GSR_int = 1'b1;
	   PRLD_int = 1'b1;
	   #(ROC_WIDTH)
	   GSR_int = 1'b0;
	   PRLD_int = 1'b0;
    end

    initial begin
	   GTS_int = 1'b1;
	   #(TOC_WIDTH)
	   GTS_int = 1'b0;
    end
endmodule
