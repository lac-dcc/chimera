// This program was cloned from: https://github.com/anik-m/hdlbits_for_verilog
// License: GNU General Public License v3.0

module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
    //reg [255:0]tor;
    reg [15:0][15:0] tor,torn;
    integer count;
    assign torn = q;
    always @(*) begin
        for(int i=0;i<16;i=i+1) begin
            for(int j=0;j<16;j=j+1) begin
                count = torn[i==0 ? 15 : i-1][j]+                     //value of cell to the left
                		torn[i==0 ? 15 : i-1][j==0 ? 15 : j-1]+      //value of cell to the upper left
                		torn[i==0 ? 15 : i-1][j==15 ? 0 : j+1]+      //value of cell to the lower left
                		torn[i==15 ? 0 : i+1][j]+                 	//value of cell to the right
                		torn[i==15 ? 0 : i+1][j==0 ? 15 : j-1]+       //value of cell to the upper right
               			torn[i==15 ? 0 : i+1][j==15 ? 0 : j+1]+       //value of cell to the lower right
                		torn[i][j==0 ? 15 : j-1]+      //value of cell above
                		torn[i][j==15 ? 0 : j+1];      //value of cell below;
                tor[i][j] = (count == 2)? torn[i][j]: (count==3)?1:0;
                //case(count) 
						//4'h0: qm_next[x][y] = 1'b0;
						//4'h1: qm_next[x][y] = 1'b0;
                  //  4'h2: tor[i][j] = torn[i][j];
                    //4'h3: tor[i][j] = 1'b1;
                    //default: tor[i][j] = 1'b0;
				//endcase
            end
        end
    end
    always @(posedge clk) begin
        if(load)
            q<=data;
        else begin
            q<=tor;
            //for(int i=0;i<16;i=i+1) begin
            	//for(int j=0;j<16;j=j+1) begin
                //    q[i*16+j]<=tor[i][j];
            	//end
        	//end
        end
    end 
endmodule
