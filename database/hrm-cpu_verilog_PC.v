// This program was cloned from: https://github.com/adumont/hrm-cpu
// License: GNU General Public License v3.0

`default_nettype none

module PC (
        input clk,              // clock
        input rst,              // active high reset
        input [7:0] jmpAddr,    // jump destination Addr
        // control signals
        input branch,
        input ijump,
        input aluFlag,
        input wPC,
        // output: register value
        output reg [7:0] PC
    );

    initial PC = 8'h00;

    always @(posedge clk) begin
        if(rst)
            PC <= 8'h00;
        else if(wPC) begin
            if( branch && ( ijump || aluFlag ) ) 
                PC <= jmpAddr;
            else 
                PC <= PC + 1;
        end
        else
            PC <= PC;
    end


    `ifdef FORMAL
        reg f_past_valid = 0;

	rand reg [7:0] monitor_addr;

        // assume startup in reset
        always @(posedge clk) begin
            f_past_valid <= 1;
            if(f_past_valid == 0)
                assume(rst);

            // cover we can reach any addr
            cover( $past(PC)!=0 && PC==8'h0A && $past(PC) != PC);

        end
    `endif

endmodule
