// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

module nh_lcd_command (
  input               rst,
  input               clk,

  output      [31:0]  debug,

  //Control Signals
  input               i_cmd_write_stb,
  input               i_cmd_read_stb,
  input       [7:0]   i_cmd_data,
  output  reg [7:0]   o_cmd_data,
  input               i_enable,
  input               i_cmd_parameter,
  output  reg         o_cmd_finished,

  //Physical Signals
  output              o_cmd_mode,
  output  reg         o_write,
  output  reg         o_read,
  output  reg [7:0]   o_data_out,
  input       [7:0]   i_data_in,
  output  reg         o_data_out_en
);

//Local Parameters
localparam  IDLE      = 4'h0;
localparam  READ_WAIT = 4'h1;
localparam  FINISHED  = 4'h2;

//Registers/Wires
reg           [3:0]   state;
//Submodules
//Asynchronous Logic
assign  o_cmd_mode    = i_cmd_parameter;

//Synchronous Logic
always @ (posedge clk) begin
  if (rst) begin
    state                   <=  IDLE;
    o_data_out_en           <=  0;
    o_data_out              <=  0;
    o_cmd_finished          <=  0;
    o_cmd_data              <=  0;

    o_write                 <=  0;
    o_read                  <=  0;
  end
  else begin
    //Strobes
    o_cmd_finished          <=  0;

    //State Machine
    case (state)
      IDLE: begin
        o_write             <=  0;
        o_read              <=  0;

        o_data_out_en       <=  0;
        if (i_cmd_write_stb) begin
          //Change the bus to an output
          o_data_out_en     <=  1;
          //Put the data on the bus
          o_data_out        <=  i_cmd_data;
          o_write           <=  1;
          state             <=  FINISHED;
        end
        else if (i_cmd_read_stb) begin
          //Change the bus to an input
          o_data_out_en     <=  0;
          o_read            <=  1;
          state             <=  READ_WAIT;
        end
      end
      READ_WAIT: begin
        state               <=  FINISHED;
      end
      FINISHED: begin
        o_write             <=  0;
        o_read              <=  0;
        if (!o_data_out_en) begin
          //XXX: The appliction note doesn't describe how to explicitly read
          //and the protocol is different from the 8080 MCU interface
          o_cmd_data        <=  i_data_in;
        end
        o_cmd_finished      <=  1;
        state               <=  IDLE;
      end
    endcase
  end
end

endmodule
