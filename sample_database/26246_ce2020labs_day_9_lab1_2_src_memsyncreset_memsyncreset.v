// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module memsyncreset
#( parameter ADDR_WIDTH=0,
				 RAMLENGTH=0
)
(
	input clk, memreset,
	output [ADDR_WIDTH:0] resetcnt,
	output reg memenable
); 

reg [1:0]               stp;
//counter for syncronyous memreset
reg [ADDR_WIDTH:0]  counter;//='d800;


    always @(posedge clk) begin
        
        case( stp )

        0: begin
            memenable <= 0;
            counter <= '0;
            stp <= 1;
        end

        1: begin
            counter <= counter + 1;
            if( counter == RAMLENGTH )
                stp <= 2;
        end

        2: begin
          
            memenable <= 1;
        end

        endcase

        if( memreset )
            stp <= 0;

    end
	 
	 assign resetcnt=counter;

endmodule