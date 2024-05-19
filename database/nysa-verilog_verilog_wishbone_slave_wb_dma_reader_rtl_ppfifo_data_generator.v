// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

module ppfifo_data_generator (
  input               clk,
  input               rst,
  input               i_enable,

  //Ping Pong FIFO Interface
  input       [1:0]   i_wr_rdy,
  output  reg [1:0]   o_wr_act,
  input       [23:0]  i_wr_size,
  output  reg         o_wr_stb,
  output  reg [31:0]  o_wr_data
);

//Local Parameters
//Registers/Wires
reg   [23:0]          r_count;
//Submodules
//Asynchronous Logic
//Synchronous Logic
always @ (posedge clk) begin
  if (rst) begin
    o_wr_act        <=  0;
    o_wr_stb        <=  0;
    o_wr_data       <=  0;
    r_count         <=  0;
  end
  else begin
    //Reset strobe signals
    o_wr_stb        <= 0;
    if (i_enable) begin
      if ((i_wr_rdy > 0) && (o_wr_act == 0))begin
        r_count     <=  0;
        if (i_wr_rdy[0]) begin
          //Channel 0 is open
          o_wr_act[0]  <=  1;
        end
        else begin
          //Channel 1 is open
          o_wr_act[1]  <=  1;
        end
      end
      else if (o_wr_act > 0) begin
        if (r_count < i_wr_size) begin
          //More room left in the buffer
          r_count   <=  r_count + 1;
          o_wr_stb  <=  1;
          //put the count in the data
          o_wr_data <=  r_count;
        end
        else begin
          //Filled up the buffer, release it
          o_wr_act  <=  0;
        end
      end
    end
  end
end

endmodule
