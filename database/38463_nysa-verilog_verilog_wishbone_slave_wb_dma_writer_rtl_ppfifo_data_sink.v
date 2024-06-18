// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

module ppfifo_data_sink (
  input               clk,
  input               rst,

  //Ping Pong FIFO Interface
  input               i_rd_rdy,
  output  reg         o_rd_act,
  input       [23:0]  i_rd_size,
  output  reg         o_rd_stb,
  input       [31:0]  i_rd_data
);

//Local Parameters
//Registers/Wires
reg   [23:0]          r_count;
//Submodules
//Asynchronous Logic
//Synchronous Logic
always @ (posedge clk) begin
  if (rst) begin
    o_rd_act          <=  0;
    r_count           <=  0;
    o_rd_stb          <=  0;
  end
  else begin
    //Strobes
    o_rd_stb          <=  0;
    if (i_rd_rdy && !o_rd_act) begin
      r_count         <=  0;
      o_rd_act        <=  1;
    end
    else begin
      if (o_rd_act) begin
        if (r_count < i_rd_size) begin
          o_rd_stb      <=  1;
          r_count       <=  r_count + 1;
        end
        else begin
          o_rd_act      <=  0;
        end
      end
    end
  end
end


endmodule
