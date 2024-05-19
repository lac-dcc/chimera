// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module sfp(
    input   detect,
    input   los,
    output  shutdown,
    output  tx,
    
    input   clk,
    output  o_detect,
    output  o_los,
    input   i_shutdown
);


    assign o_detect = ~detect;
    assign o_los = los;
    assign shutdown = i_shutdown;

    reg r_tx = 1'b0;
    reg [26:0] c;
    always @(posedge clk) begin
	     // (100e6/f/2)-1
        //if (c == 100000000)   // 1 Hz
        //if (c == 4999)        // 10 kHz
		  //if (c == 1999)        // 25 kHz
		  //if (c == 1427)        // 35 kHz
        //if (c == 999)         // 50 kHz
        //if (c == 499)         // 100 kHz
        //if (c == 199)         // 250 kHz
        if (c == 49)          // 1 MHz
            begin
                r_tx <= ~r_tx;
                c <= 0; 
            end
        else
            begin
                c <= c + 1'b1; 
            end
    end
    assign tx = r_tx;
endmodule
