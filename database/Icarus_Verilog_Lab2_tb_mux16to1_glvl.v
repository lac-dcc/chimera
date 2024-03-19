`include "mux16to1_glvl.v"
module tb_mux16to1_glvl();

    reg [15:0] inp;
    reg [3:0] sel;
    wire outp;

    mux16to1_glvl mux(.outp(outp), .sel(sel), .inp(inp));

    initial begin
        $dumpfile("tb_mux16to1_glvl.vcd");
        $dumpvars;
    end
	
	initial begin
		
		$monitor("inp = %b, sel = %b, outp = %b", inp, sel, outp);
		
	end
	
	
    initial begin

         inp = 16'b0000_0101_1111_1010; sel = 4'b0000;
                                    #5  sel = 4'b0001;
                                    #5  sel = 4'b0010;
                                    #5  sel = 4'b0011;
                                    #5  sel = 4'b0100;
                                    #5  sel = 4'b0101;
                                    #5  sel = 4'b0110;
                                    #5  sel = 4'b0111;

                                    #5  sel = 4'b1000;
                                    #5  sel = 4'b1001;
                                    #5  sel = 4'b1010;
                                    #5  sel = 4'b1011;

                                    #5  sel = 4'b1100;
                                    #5  sel = 4'b1101;
                                    #5  sel = 4'b1110;
                                    #5  sel = 4'b1111;
        #5  $finish;

    end

endmodule