// This program was cloned from: https://github.com/fpgasystems/caribou
// License: GNU General Public License v3.0

//---------------------------------------------------------------------------
//--  Copyright 2015 - 2017 Systems Group, ETH Zurich
//-- 
//--  This hardware module is free software: you can redistribute it and/or
//--  modify it under the terms of the GNU General Public License as published
//--  by the Free Software Foundation, either version 3 of the License, or
//--  (at your option) any later version.
//-- 
//--  This program is distributed in the hope that it will be useful,
//--  but WITHOUT ANY WARRANTY; without even the implied warranty of
//--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//--  GNU General Public License for more details.
//-- 
//--  You should have received a copy of the GNU General Public License
//--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//---------------------------------------------------------------------------


module nukv_Read #(
	parameter KEY_WIDTH = 128,
	parameter META_WIDTH = 96,
	parameter HASHADDR_WIDTH = 32,
    parameter MEMADDR_WIDTH = 20
	)
    (
	// Clock
	input wire         clk,
	input wire         rst,

	input  wire [KEY_WIDTH+META_WIDTH+HASHADDR_WIDTH-1:0] input_data,
	input  wire         input_valid,
	output wire         input_ready,

	input  wire [KEY_WIDTH+META_WIDTH+HASHADDR_WIDTH-1:0] feedback_data,
	input  wire         feedback_valid,
	output wire         feedback_ready,

	output reg [KEY_WIDTH+META_WIDTH+HASHADDR_WIDTH-1:0] output_data,
	output reg         output_valid,
	input  wire         output_ready,

	output reg [31:0] rdcmd_data,
	output reg         rdcmd_valid,
	input  wire         rdcmd_ready
);

    reg selectInputNext;
    reg selectInput; //1 == input, 0==feedback

	localparam [2:0]
		ST_IDLE   = 0,
		ST_ISSUE_READ = 3,
		ST_OUTPUT_KEY  = 4;
	reg [2:0] state;    

    wire[HASHADDR_WIDTH+KEY_WIDTH+META_WIDTH-1:0] in_data;
    wire in_valid;
    reg in_ready;
    wire[31:0] hash_data;


    assign in_data = (selectInput==1) ? input_data : feedback_data;
    assign in_valid = (selectInput==1) ? input_valid : feedback_valid;
    assign input_ready = (selectInput==1) ? in_ready : 0;
    assign feedback_ready = (selectInput==1) ? 0 : in_ready;

    assign hash_data = (selectInput==1) ? input_data[KEY_WIDTH+META_WIDTH+HASHADDR_WIDTH-1:KEY_WIDTH+META_WIDTH] : feedback_data[KEY_WIDTH+META_WIDTH+HASHADDR_WIDTH-1:KEY_WIDTH+META_WIDTH];    

    wire[MEMADDR_WIDTH-1:0] addr;    

    assign addr = hash_data[31:32 - MEMADDR_WIDTH] ^ hash_data[MEMADDR_WIDTH-1:0];

    always @(posedge clk) begin
    	if (rst) begin
    		selectInput <= 1;
    		selectInputNext <= 0;    		
    		state <= ST_IDLE;
    		in_ready <= 0;
    		rdcmd_valid <= 0;
    		output_valid <= 0;    		
    	end
    	else begin

    		if (rdcmd_ready==1 && rdcmd_valid==1) begin
    			rdcmd_valid <= 0;
    		end

    		if (output_ready==1 && output_valid==1) begin
    			output_valid <= 0;
    		end

            in_ready <= 0;


    		case (state)    		
    			ST_IDLE : begin
    				if (output_ready==1 && rdcmd_ready==1) begin
    					selectInput <= selectInputNext;
    					selectInputNext <= ~selectInputNext;

    					if (selectInputNext==1 && input_valid==0 && feedback_valid==1) begin
    						selectInput <= 0;
    						selectInputNext <= 1;    						
    					end

    					if (selectInputNext==0 && input_valid==1 && feedback_valid==0) begin
    						selectInput <= 1;
    						selectInputNext <= 0;    						
    					end

    					if (selectInput==1 && input_valid==1) begin
    						state <= ST_ISSUE_READ;    						
    					end

						if (selectInput==0 && feedback_valid==1) begin
    						state <= ST_ISSUE_READ;    						
    					end    					

    				end
    			end

    			ST_ISSUE_READ: begin    			
                    if (in_data[KEY_WIDTH+META_WIDTH-4]==1) begin
                        // ignore this and don't send read!

                    end else begin			                        
        				   rdcmd_data <= addr;
    					   rdcmd_valid <= 1;
                           rdcmd_data[31:MEMADDR_WIDTH] <= 0;    				    
                    end

    				state <= ST_OUTPUT_KEY;                      
                    output_data <= in_data;  
                    output_data[KEY_WIDTH+META_WIDTH+HASHADDR_WIDTH-1:KEY_WIDTH+META_WIDTH] <= addr; //(in_data[KEY_WIDTH+META_WIDTH-1]==0) ? addr1 : addr2;

                    in_ready <= 1;  				

    			end

    			ST_OUTPUT_KEY: begin
    				if (output_ready==1) begin
    					
                        output_valid <= 1;

                        state <= ST_IDLE;
    				end
    			end


    		endcase
    	end
    end
        
    endmodule
