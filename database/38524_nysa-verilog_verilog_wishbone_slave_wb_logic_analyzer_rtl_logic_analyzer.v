// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License



module logic_analyzer # (
  parameter CAPTURE_WIDTH             = 32,
  parameter CAPTURE_DEPTH             = 10
) (
  input                               clk,
  input                               rst,

  input                               i_cap_clk,
  input                               i_cap_ext_trig,
  input       [31:0]                  i_cap_data,

  input       [31:0]                  i_trigger,
  input       [31:0]                  i_trigger_mask,
  input       [31:0]                  i_trigger_after,
  input       [31:0]                  i_trigger_edge,
  input       [31:0]                  i_both_edges,
  input       [31:0]                  i_repeat_count,
  input                               i_force_stb,
  input                               i_enable,
  input                               i_restart,
  output  reg [31:0]                  o_capture_start,
  output  reg                         o_finished = 0,
  output      [31:0]                  o_capture_size,

  input       [31:0]                  i_bram_addr,
  output      [CAPTURE_WIDTH - 1:0]   o_bram_data
);

//Local Parameter
localparam      CAPTURE_SIZE  = (1 << CAPTURE_DEPTH);

localparam      IDLE          = 0;
localparam      SETUP         = 1;
localparam      CONT_READ     = 2;
localparam      CAPTURE       = 3;
localparam      FINISHED      = 4;

//Registers/Wires
reg   [3:0]                       state;

reg   [CAPTURE_DEPTH - 1: 0]      r_in_pointer;
reg   [CAPTURE_DEPTH - 1: 0]      r_out_pointer;
reg   [CAPTURE_DEPTH - 1: 0]      r_start;
wire  [CAPTURE_DEPTH - 1: 0]      w_last;
wire                              w_full;

reg                               r_cap_wr_stb;
reg                               r_start_stb;
reg                               r_pos_start_stb;
reg                               r_neg_start_stb;

reg   [31:0]                      r_repeat_count;
reg   [31:0]                      r_prev_cap;
wire  [31:0]                      w_cap_pos_edge;
wire  [31:0]                      w_cap_neg_edge;
wire  [31:0]                      w_cap_sig_start;

wire                              w_cap_start;
wire  [31:0]                      w_inv_cap_data;
wire  [31:0]                      w_inv_cap_prev_data;

//Submodules
dpb #(
  .DATA_WIDTH     (CAPTURE_WIDTH                    ),
  .ADDR_WIDTH     (CAPTURE_DEPTH                    )
) local_buffer (                                    
                                                    
  .clka           (i_cap_clk                        ),
  .wea            (r_cap_wr_stb                     ),
  .addra          (r_in_pointer                     ),
  .dina           (r_prev_cap                       ),
                                                    
  .clkb           (clk                              ),
  .web            (1'b0                             ),
  .addrb          (i_bram_addr[CAPTURE_DEPTH - 1:0] ),
  .dinb           (32'h0                            ),
  .doutb          (o_bram_data                      )
);


//Asynchronous Logic
assign  o_capture_size  = CAPTURE_SIZE;
assign  w_last          = r_start + ((CAPTURE_SIZE - 1) - i_trigger_after);
assign  w_full          = r_in_pointer == w_last;
assign  w_cap_start     = (w_cap_sig_start == 32'hFFFFFFFF);

assign  w_inv_cap_data      = ~i_cap_data;
assign  w_inv_cap_prev_data = ~r_prev_cap;

genvar i;
generate
  for (i = 0; i < 32; i = i + 1) begin : la
    assign  w_cap_pos_edge[i]   =  i_cap_data[i] & ~r_prev_cap[i];
    assign  w_cap_neg_edge[i]   = ~i_cap_data[i] &  r_prev_cap[i];
    assign  w_cap_sig_start[i]  =
              (~i_trigger_mask[i]) ? 1 :                                          //If the mask is 0 then this is true
                i_trigger_edge[i] ?                                               //Look For Edge
                  (i_both_edges[i] & (w_cap_pos_edge[i] | w_cap_neg_edge[i])) |   //Both Edges
                  (i_trigger[i] & w_cap_pos_edge[i]) | (~i_trigger[i] & w_cap_neg_edge[i]) :  //Pos/Neg Edge
                (i_trigger[i] & i_cap_data[i]) | (~i_trigger[i] & ~i_cap_data[i]);//Not edge but level and data
  end
endgenerate

//Synchronous Logic
always @ (posedge i_cap_clk) begin
  r_cap_wr_stb              <=  0;
  if (rst) begin
    r_in_pointer            <=  0;
    r_start                 <=  0;
    o_capture_start         <=  0;
    r_repeat_count          <=  0;
    r_prev_cap              <=  32'h0;
    state                   <=  IDLE;
    o_finished              <=  0;
  end
  else begin
    r_prev_cap              <=  i_cap_data;
    case (state)
      IDLE: begin
        o_capture_start     <=  0;
        r_in_pointer        <=  0;
        r_repeat_count      <=  0;
        r_start             <=  0;
        if (i_enable) begin
          if ((i_trigger_after > 0) || (i_repeat_count > 0)) begin
            //Special Case, need to continue reading data, we have a history
            state           <=  CONT_READ;
          end
          else if(w_cap_start || i_cap_ext_trig) begin
            r_cap_wr_stb    <=  1;
            state           <=  CAPTURE;
          end
        end
        if (i_force_stb) begin
          state             <=  CAPTURE;
        end
      end
      CONT_READ: begin
        r_cap_wr_stb        <=  1;
        r_start             <=  r_start + 1;
        r_in_pointer        <=  r_start + 1;
        if (w_cap_start) begin
          if (r_repeat_count < i_repeat_count) begin
            r_repeat_count     <=  r_repeat_count + 1;
          end
          else begin
            state           <=  CAPTURE;
          end
        end
      end
      CAPTURE: begin
        if (w_full) begin
          state             <=  FINISHED;
          if (r_start < i_trigger_after) begin
            //Wrap around case
            o_capture_start <=  (CAPTURE_SIZE - 1) + r_start - i_trigger_after;
          end
          else begin
            o_capture_start <=  r_start - i_trigger_after;
          end
        end
        else begin
          r_cap_wr_stb      <=  1;
          r_in_pointer      <=  r_in_pointer + 1;
        end
      end
      FINISHED: begin
        o_finished          <=  1;
        if (!i_enable) begin
          o_finished        <=  0;
          state             <=  IDLE;
        end
      end
      default: begin
        state       <=  IDLE;
      end
    endcase
  end
end


endmodule
