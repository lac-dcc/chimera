//##############################################################################################################
//##############################################################################################################
//##############################################################################################################
//###                         Copyright 2022~2023 Wilson Chen                                                ###
//###            Licensed under the Apache License, Version 2.0 (the "License");                             ###
//###            You may not use this file except in compliance with the License.                            ###
//###            You may obtain a copy of the License at                                                     ###
//###                    http://www.apache.org/licenses/LICENSE-2.0                                          ###
//###            Unless required by applicable law or agreed to in writing, software                         ###
//###            distributed under the License is distributed on an "AS IS" BASIS,                           ###
//###            WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.                    ###
//###            See the License for the specific language governing permissions and                         ###
//###            limitations under the License.                                                              ###
//##############################################################################################################
//##############################################################################################################
//##############################################################################################################

//================================================================================================
//======= this is internal design for Sync Fifo ===============
//================================================================================================
//// default module name is : sync_fifo

module <:$mod_name:> 
  parameter DATA_WIDTH = <:$dwd:>;
  parameter DATA_DEPTH = <:$depth:>;
  parameter PTR_WIDTH  = <:$awd:>;
//parameter PTR_WIDTH  = $clog2(DATA_DEPTH)
(
  input  wire                    <:$clk:>,
  input  wire                    rstn ,
  
  //write interface
  input  wire                    wr_en  ,
  input  wire  [DATA_WIDTH-1:0]  wr_din,
  
  //read interface
  input  wire                    rd_en ,
  output reg   [DATA_WIDTH-1:0]  rd_dout,
  
  //Flags_o
  output reg                     full   ,
  output reg                     empty  
);

<:
	if ($noram == 1) {
		$OUT .= " reg  [DATA_WIDTH-1:0]  FIFO_DFF_ARRAY  [DATA_DEPTH-1:0];";
	}
:>

  reg  [PTR_WIDTH-1 :0]  wr_ptr                      ;
  reg  [PTR_WIDTH-1 :0]  rd_ptr                      ;
  reg  [PTR_WIDTH   :0]  elem_cnt                    ;
  reg  [PTR_WIDTH   :0]  elem_cnt_nxt                ;
 //Flags
  wire                   full_comb                   ;
  wire                   empty_comb                  ;

/*---------------------------------------------------\
  --------------- write poiter addr ----------------
\---------------------------------------------------*/
always @ (posedge clk_i or negedge rst_n_i) begin
  if (!rst_n_i) begin
    wr_ptr <= 3'b0;
  end
  else if (wr_en_i && !full_o) begin
    wr_ptr <= wr_ptr + 3'b1;
  end
end

/*---------------------------------------------------\
  -------------- read poiter addr ------------------
\---------------------------------------------------*/
always @ (posedge clk_i or negedge rst_n_i) begin
  if (!rst_n_i) begin
    rd_ptr <= 3'b0;
  end
  else if (rd_en_i && !empty_o) begin
    rd_ptr <= rd_ptr + 3'b1;
  end
end

/*---------------------------------------------------\
  --------------- element counter ------------------
\---------------------------------------------------*/

always @ (posedge clk_i or negedge rst_n_i) begin
  if (!rst_n_i) begin
    elem_cnt <= 4'b0;
  end
  else if (wr_en_i && rd_en_i && !full_o && !empty_o) begin
    elem_cnt <= elem_cnt;
  end
  else if(wr_en_i && !full_o) begin
    elem_cnt <= elem_cnt + 1'b1;
  end
  else if(rd_en_i && !empty_o) begin
    elem_cnt <= elem_cnt - 1'b1;
  end
end

/*---------------------------------------------------\
  ------------- generate the flags -----------------
\---------------------------------------------------*/
always @(*) begin
  if(!rst_n_i) begin
    elem_cnt_nxt = 1'b0;
  end
  else if(elem_cnt != 4'd0 && rd_en_i && !empty_o) begin
    elem_cnt_nxt = elem_cnt - 1'b1; 
  end
  else if(elem_cnt != 4'd8 && wr_en_i && !full_o) begin
    elem_cnt_nxt = elem_cnt + 1'b1; 
  end
  else begin
    elem_cnt_nxt = elem_cnt;
  end
end

assign full_comb  = (elem_cnt_nxt == 4'd8);
assign empty_comb = (elem_cnt_nxt == 4'd0);

always @ (posedge clk_i or negedge rst_n_i) begin
  if (!rst_n_i) begin
    full <= 1'b0;
  end
  else begin
    full <= full_comb;
  end
end

always @ (posedge clk_i or negedge rst_n_i) begin
  if (!rst_n_i) begin
    empty <= 1'b1;
  end
  else begin
    empty <= empty_comb;
  end
end


<:
   if ($noram) {
	   $OUT .= "
/*---------------------------------------------------\
  -------------------- read data -------------------
\---------------------------------------------------*/
always @ (posedge clk_i or negedge rst_n_i) begin
  if (!rst_n_i) begin
    rd_data_o <= 32'b0;
  end
  else if(rd_en_i && !empty_o) begin
    rd_data_o <= FIFO_DFF_ARRAY[rd_ptr];
  end
end

/*---------------------------------------------------\
  ------------------- write data -------------------
\---------------------------------------------------*/
reg [PTR_WIDTH:0] i;

always @ (posedge clk_i or negedge rst_n_i) begin
  if (!rst_n_i) begin
    for(i=0;i<DATA_DEPTH;i=i+1) begin
      FIFO_DFF_ARRAY[i] <= 32'b0;
    end
  end
  else if(wr_en_i && !full_o) begin
    FIFO_DFF_ARRAY[wr_ptr] <= wr_data_i;
  end
end

endmodule
";
   } else {
	   $OUT .= "
    //WARNING!!!: You need to replace your sram for you project a/o foundary
	mem_foundary_wrap mem_inst (
	   .clk(wr_clk),
	   .wen(wr_en),
	   .ren(rd_en),
	   .waddr(wr_ptr),
	   .raddr(rd_ptr),
	   .din(wr_din),
	   .dout(rd_dout)
	 );

endmodule
";
   }
:> 

