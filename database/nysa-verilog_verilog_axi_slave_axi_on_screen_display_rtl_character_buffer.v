// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
Distributed under the MIT license.
Copyright (c) 2017 Dave McCoy (dave.mccoy@cospandesign.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

/*
 * Author:
 * Description:
 *
 *  When the user enters a new character on i_char and strobes 'i_char_stb'
 *  then the it will be inserted into the buffer
 *
 *
 * Changes:     Who?    What?
 *  XX/XX/XXXX  XXX     XXXX
 */

`timescale 1ps / 1ps
`include "char_defines.v"

module character_buffer #(
  parameter CONSOLE_DEPTH       = 12,
  parameter FONT_WIDTH          = 5,
  parameter FONT_HEIGHT         = 8,
  parameter CHAR_IMAGE_WIDTH    = 80,
  parameter CHAR_IMAGE_HEIGHT   = 34,
  parameter CHAR_IMAGE_SIZE     = CHAR_IMAGE_WIDTH * CHAR_IMAGE_HEIGHT
)(
  input                     clk,
  input                     rst,

  input                     i_alt_func_en,
  input                     i_clear_screen_stb,

  input       [2:0]         i_tab_count,
  input                     i_char_stb,
  input       [7:0]         i_char,
  output                    o_wr_char_rdy,

  input                     i_read_frame_stb,
  input                     i_char_req_en,
  output  reg               o_char_rdy,
  output      [7:0]         o_char,

  //When new frame is strobed the address is put back to the beginning of the frame
  input                     i_scroll_en,
  input                     i_scroll_up_stb,
  input                     i_scroll_down_stb
);
//local parameters
localparam      IDLE                    = 0;
localparam      PROCESS_NORMAL_CHAR     = 1;
localparam      PROCESS_BACKSPACE_PREP  = 2;
localparam      PROCESS_BACKSPACE       = 3;
localparam      NOM_BLANKS_PREP1        = 4;
localparam      NOM_BLANKS_PREP2        = 5;
localparam      NOM_BLANKS              = 6;
localparam      PROCESS_CARRIAGE_RETURN = 7;
localparam      PROCESS_TAB             = 8;
localparam      CLEAR_BUFFER            = 9;
localparam      CLEAR_LINE              = 10;

localparam      START_READ_FRAME        = 1;
localparam      START_READ_FRAME_DELAY  = 2;
localparam      GET_CHAR                = 3;
localparam      GET_CHAR_DELAY          = 4;




localparam      CONSOLE_SIZE            = (1 << CONSOLE_DEPTH);
localparam      MAX_LINES               = CONSOLE_SIZE / CHAR_IMAGE_WIDTH;

//registes/wires
reg         [3:0]                   in_state;
reg         [3:0]                   out_state;

reg                                 r_char_stb;
reg                                 r_bs_line_flag;
//reg         [CONSOLE_DEPTH - 1:0]   r_write_addr_pos;
reg         [CONSOLE_DEPTH    :0]   r_write_addr_pos;
wire        [CONSOLE_DEPTH - 1:0]   w_write_addr_pos;
reg         [CONSOLE_DEPTH - 1:0]   r_write_addr_pos_prev;
reg         [CONSOLE_DEPTH - 1:0]   r_write_addr_end;
wire        [CONSOLE_DEPTH - 1:0]   w_write_addr_start;

reg         [CONSOLE_DEPTH - 1:0]   r_char_line_count;


reg         [7:0]                   r_char;
reg         [2:0]                   r_tab_count;
wire        [7:0]                   w_char;
wire                                w_buf_full;
wire        [CONSOLE_DEPTH - 1: 0]  w_read_addr;
reg         [CONSOLE_DEPTH - 1: 0]  r_read_addr;

reg         [CONSOLE_DEPTH - 1: 0]  r_read_char_count;

reg         [CONSOLE_DEPTH - 1: 0]  r_start_frame_addr;
reg         [CONSOLE_DEPTH    : 0]  r_prev_line_addr;
wire        [CONSOLE_DEPTH - 1: 0]  w_prev_line_addr;
reg         [CONSOLE_DEPTH    : 0]  r_curr_line_addr;
wire        [CONSOLE_DEPTH - 1: 0]  w_curr_line_addr;
reg         [CONSOLE_DEPTH    : 0]  r_next_line_addr;
wire        [CONSOLE_DEPTH - 1: 0]  w_next_line_addr;

reg                                 r_dbg_prev_wrap_stb;
reg                                 r_dbg_next_wrap_stb;
reg                                 r_dbg_next_stb;
reg                                 r_dbg_prev_stb;

wire                                w_in_busy;
wire                                w_out_busy;
wire                                w_clear_screen;
wire                                w_backspace;

reg         [3:0]                   r_font_height_pos;
reg         [7:0]                   r_read_width_pos;
reg                                 r_clear_req;
wire                                w_scroll_enable;

wire        [CONSOLE_DEPTH - 1: 0]  w_prev_line_addr_start = (CONSOLE_SIZE - CHAR_IMAGE_WIDTH);

//*************** DEBUG ******************************************************

wire        [CONSOLE_DEPTH - 1: 0]  w_dbg_char_image_width = CHAR_IMAGE_WIDTH;
wire        [CONSOLE_DEPTH - 1: 0]  w_dbg_char_image_height = CHAR_IMAGE_HEIGHT;
wire        [CONSOLE_DEPTH - 1: 0]  w_dbg_char_image_size = CHAR_IMAGE_SIZE;
wire        [CONSOLE_DEPTH    : 0]  w_dbg_console_depth = CONSOLE_SIZE;
wire        [CONSOLE_DEPTH - 1: 0]  w_dbg_max_lines = MAX_LINES;

//****************************************************************************

assign  w_prev_line_addr    = r_prev_line_addr;
assign  w_curr_line_addr    = r_curr_line_addr;
assign  w_next_line_addr    = r_next_line_addr;
assign  w_scroll_enable     = (r_char_line_count >= CHAR_IMAGE_HEIGHT);
//assign  w_read_addr         = r_read_addr;

//submodules
bram #(
  .DATA_WIDTH       (8                  ),
  .ADDR_WIDTH       (CONSOLE_DEPTH      )   //4096 Console Depth
) char_buffer (
  .clk              (clk                ),
  .rst              (rst                ),
  .en               (1'b1               ),
  .we               (r_char_stb         ),
  .write_address    (w_write_addr_pos   ),
  .data_in          (r_char             ),

  .read_address     (w_read_addr        ),
  .data_out         (o_char             )
);

//asynchronous logic
assign  w_in_busy           = (in_state  != IDLE);
assign  o_wr_char_rdy       = !w_in_busy;
assign  w_out_busy          = (out_state != IDLE);
assign  w_buf_full          = (w_write_addr_pos == r_write_addr_end);
assign  w_write_addr_start  = r_write_addr_end + 1;
//assign  w_read_addr         = r_read_addr;
assign  w_read_addr         = w_backspace ? w_write_addr_pos : r_read_addr;
assign  w_write_addr_pos    = r_write_addr_pos;
assign  w_clear_screen      = ((in_state == CLEAR_BUFFER)       ||
                               (in_state == CLEAR_LINE));
assign  w_backspace         = ((in_state == PROCESS_BACKSPACE)  ||
                               (in_state == NOM_BLANKS)         ||
                               (in_state == NOM_BLANKS_PREP1)   ||
                               (in_state == NOM_BLANKS_PREP2));

//synchronous logic

//Incomming state machine
always @ (posedge clk) begin
  r_char_stb              <=  0;
  r_dbg_prev_wrap_stb     <=  0;
  r_dbg_next_wrap_stb     <=  0;
  r_dbg_next_stb          <=  0;
  r_dbg_prev_stb          <=  0;
  if (rst) begin
    r_char                <=  0;
    r_write_addr_pos      <=  0;
    r_write_addr_pos_prev <=  0;
    r_write_addr_end      <=  (CONSOLE_SIZE - 1);
    r_tab_count           <=  0;

    //r_prev_line_addr      <=  (1 << CONSOLE_DEPTH) - CHAR_IMAGE_WIDTH;
    r_prev_line_addr      <=  w_prev_line_addr_start;
    r_curr_line_addr      <=  0;
    r_next_line_addr      <=  CHAR_IMAGE_WIDTH;
    in_state              <=  CLEAR_BUFFER;
    r_clear_req           <=  0;
    r_char_line_count     <=  0;
    r_bs_line_flag        <=  0;
  end
  else begin

    case (in_state)
      IDLE: begin
        r_bs_line_flag        <=  0;
        r_tab_count           <=  0;
        if (r_clear_req && (out_state == IDLE)) begin
          r_clear_req         <=  0;
          r_char_stb          <=  1;
          r_char              <=  0;
          r_write_addr_pos    <=  0;
          r_write_addr_end    <=  ((CONSOLE_SIZE) - 1);
          in_state            <=  CLEAR_BUFFER;
          r_char_line_count   <=  0;
        end
        else if (i_char_stb) begin
          if (i_alt_func_en) begin
            //Allows user to put in special characters like hearts and clovers
            r_char_stb        <=  1;
            r_char            <=  i_char;
            in_state          <=  PROCESS_NORMAL_CHAR;
          end
          else begin
            case (i_char)
              `NUL: begin     //NULL Character
              end
              `SOH: begin     //Start of Header
              end
              `STX: begin     //Start of Text
              end
              `ETX: begin     //End of Text
              end
              `EOT: begin     //End of Transmission
              end
              `ENQ: begin     //Enquiry
              end
              `ACK: begin     //Ack
              end
              `BEL: begin     //Bing!
              end
              `BS : begin     //Backspace
                r_char      <=  0;
                //r_char_stb  <=  1;
                in_state    <=  PROCESS_BACKSPACE_PREP;
              end
              `HT : begin     //Horizontal Tab
                r_char      <=  0;
                r_char_stb  <=  1;
                in_state    <=  PROCESS_TAB;
              end
              `LF : begin     //Line Feed
                //Simplify this, only carriage return (goes to new line too)
                r_char      <=  0;
                r_char_stb  <=  1;
                in_state    <=  PROCESS_CARRIAGE_RETURN;
              end
              `VT : begin     //Vertical Tab
              end
              `FF : begin     //Form Feed
              end
              `CR : begin     //Carriage Return
                r_char      <=  0;
                r_char_stb  <=  1;
                in_state    <=  PROCESS_CARRIAGE_RETURN;
              end
              `SO : begin     //Shift Out
              end
              `SI : begin     //Shift In
              end
              `DLE: begin     //Data Link Escape
              end
              `DC1: begin     //Device Control 1
              end
              `DC2: begin     //Device Control 2
              end
              `DC3: begin     //Device Control 3
              end
              `DC4: begin     //Device Control 4
              end
              `NAK: begin     //Nack
              end
              `SYN: begin     //Sync
              end
              `ETB: begin     //End of Transmission Block
              end
              `CAN: begin     //Cancel
              end
              `EM : begin     //End of Medium
              end
              `SUB: begin     //Substitue
              end
              `ESC: begin     //Escape
              end
              `FS : begin     //File Seperator
              end
              `GS : begin     //Group Seperator
              end
              `RS : begin     //Record Seperator
              end
              `US : begin     //Unit Seperator
              end
              `DEL: begin     //Delete
              end
              default: begin
                //Normal Character to put into the buffer
                r_char        <=  i_char;
                r_char_stb    <=  1;
                in_state      <=  PROCESS_NORMAL_CHAR;
              end
            endcase
          end
        end
      end
      PROCESS_NORMAL_CHAR: begin
        if (w_buf_full) begin
          r_write_addr_end    <= r_write_addr_end + 1;
        end
        r_write_addr_pos      <= r_write_addr_pos + 1;
        in_state              <=  IDLE;
      end
      PROCESS_BACKSPACE_PREP: begin
        if (!w_out_busy) begin
          //in_state            <=  PROCESS_BACKSPACE;
          in_state            <=  NOM_BLANKS_PREP1;
        end
      end
      PROCESS_BACKSPACE: begin
        //if (w_write_addr_pos != w_write_addr_start) begin
        if (r_bs_line_flag && (w_write_addr_pos == w_curr_line_addr)) begin
          in_state            <=  IDLE;
        end
        else if (r_write_addr_pos != w_write_addr_start) begin
          r_write_addr_pos    <= r_write_addr_pos - 1;
          in_state            <=  NOM_BLANKS_PREP1;
        end
        else begin
          in_state            <=  IDLE; 
        end
      end
      NOM_BLANKS_PREP1: begin
        in_state              <=  NOM_BLANKS_PREP2;
      end
      NOM_BLANKS_PREP2: begin
        in_state              <=  NOM_BLANKS;
      end
      NOM_BLANKS: begin
        if (o_char == 0) begin
          in_state            <=  PROCESS_BACKSPACE;
        end
        else begin
          r_char              <=  0;
          r_char_stb          <=  1;
          in_state            <=  IDLE;
        end
      end
      PROCESS_CARRIAGE_RETURN: begin
        if (r_write_addr_pos < r_next_line_addr) begin
          if (r_char_stb) begin
            r_write_addr_pos  <=  r_write_addr_pos + 1;
          end
          r_char              <=  0;
          r_char_stb          <=  1;
        end
        else begin
          //in_state            <=  IDLE;
          in_state            <=  CLEAR_LINE;
        end
      end
      PROCESS_TAB: begin
        if (r_tab_count < i_tab_count) begin
          r_tab_count         <=  r_tab_count + 1;
          r_char              <=  0;
          r_char_stb          <=  1;
          if (w_buf_full) begin
            r_write_addr_end  <= r_write_addr_end + 1;
          end
          r_write_addr_pos    <= r_write_addr_pos + 1;
        end
        else begin
          in_state            <=  IDLE;
        end
      end
      CLEAR_BUFFER: begin
        r_prev_line_addr    <=  w_prev_line_addr_start;
        r_curr_line_addr    <=  0;
        r_next_line_addr    <=  CHAR_IMAGE_WIDTH;

        if (!w_buf_full) begin
          r_char_stb          <=  1;
          if (r_char_stb) begin
            r_char              <=  0;
            r_write_addr_pos    <=  r_write_addr_pos + 1;
            //r_write_addr_end    <=  ((1 << CONSOLE_DEPTH) - 1);
          end
        end
        else begin
	        r_char              <=  0;
          r_write_addr_pos    <=  0;
          r_write_addr_end    <=  ((CONSOLE_SIZE) - 1);
          r_tab_count         <=  0;

          //r_prev_line_addr    <=  {1'b0, (1 << CONSOLE_DEPTH) - CHAR_IMAGE_WIDTH};
          in_state            <=  IDLE;
        end
      end
      default: begin
        in_state              <=  IDLE;
      end
      CLEAR_LINE: begin
        if (r_write_addr_pos < r_next_line_addr) begin
          if (r_char_stb) begin
            r_write_addr_pos      <= r_write_addr_pos + 1;
          end
          if (w_buf_full) begin
            r_write_addr_end  <= r_write_addr_end + 1;
          end
          r_char              <=  0;
          r_char_stb          <=  1;
        end
        else begin
          r_write_addr_pos  <=  r_curr_line_addr;
          in_state          <=  IDLE;
        end
      end
    endcase

    if (!w_clear_screen) begin
      //Move to next line
      if (r_write_addr_pos >= r_next_line_addr) begin
        r_dbg_next_stb          <=  1;
        if (r_char_line_count < MAX_LINES) begin
          r_char_line_count     <=  r_char_line_count + 1;
        end
        $display("Move to next line");
        if ((r_write_addr_pos > CHAR_IMAGE_WIDTH) &&
            (r_prev_line_addr > CONSOLE_SIZE)) begin
          r_dbg_prev_wrap_stb       <=  1;
          r_prev_line_addr      <=  r_prev_line_addr + (CHAR_IMAGE_WIDTH  - CONSOLE_SIZE);
        end
        else begin
          r_prev_line_addr      <=  r_prev_line_addr + CHAR_IMAGE_WIDTH;
        end
        if ((r_curr_line_addr > CONSOLE_SIZE) &&
            (r_next_line_addr > CONSOLE_SIZE)) begin
          r_curr_line_addr      <=  r_curr_line_addr + (CHAR_IMAGE_WIDTH - CONSOLE_SIZE);
          r_next_line_addr      <=  r_next_line_addr + (CHAR_IMAGE_WIDTH - CONSOLE_SIZE);
          r_write_addr_pos[CONSOLE_DEPTH] <=  0;
          r_dbg_next_wrap_stb   <=  1;
        end
        else begin
          r_next_line_addr      <=  r_next_line_addr + CHAR_IMAGE_WIDTH;
          r_curr_line_addr      <=  r_curr_line_addr + CHAR_IMAGE_WIDTH;
        end
      end



      //Move to previous line
      else if (w_backspace && (r_write_addr_pos < r_curr_line_addr)) begin
      //else if (w_backspace && (w_write_addr_pos < w_curr_line_addr)) begin
        r_bs_line_flag          <=  1;
        if (r_char_line_count > 0) begin
          r_char_line_count     <=  r_char_line_count - 1;
        end

        if (r_prev_line_addr < CHAR_IMAGE_WIDTH) begin
          r_prev_line_addr      <= r_prev_line_addr + (CONSOLE_SIZE - CHAR_IMAGE_WIDTH);
        end
        else begin
          r_prev_line_addr      <=  r_prev_line_addr - CHAR_IMAGE_WIDTH;
        end
        if (r_curr_line_addr < (2 * CHAR_IMAGE_WIDTH)) begin
          //r_curr_line_addr      <= {1'b1, w_prev_line_addr}; 
          //r_curr_line_addr      <=  r_prev_line_addr; 
          r_curr_line_addr      <=  r_curr_line_addr + (CONSOLE_SIZE - CHAR_IMAGE_WIDTH); 
          r_write_addr_pos      <=  r_write_addr_pos + CONSOLE_SIZE;
        end
        else begin
          r_curr_line_addr      <=  r_prev_line_addr;
        end
        if (r_next_line_addr < (3 * CHAR_IMAGE_WIDTH)) begin
          //r_next_line_addr      <= {1'b1, w_curr_line_addr}; 
          r_next_line_addr      <=  r_next_line_addr + (CONSOLE_SIZE - CHAR_IMAGE_WIDTH);
        end
        else begin
          r_next_line_addr      <=  r_curr_line_addr;
        end
      end

    end
    if (i_clear_screen_stb) begin
      r_clear_req                <=  1;
    end
  end
end

//Outgoing state machine
always @ (posedge clk) begin
  o_char_rdy                    <=  0;
  if (rst) begin
    r_read_addr                 <=  0;
    r_read_char_count           <=  0;
    r_read_width_pos            <=  0;
    r_start_frame_addr          <=  0;
    out_state                   <=  IDLE;

    r_font_height_pos           <=  0;
    o_char_rdy                  <=  0;
    //w_scroll_enable             <=  0;
  end
  else begin
    case (out_state)
      IDLE: begin
        o_char_rdy              <=  0;
        r_font_height_pos       <=  0;
        if (i_read_frame_stb) begin
          out_state             <=  START_READ_FRAME;
        end
      end
      START_READ_FRAME: begin
        o_char_rdy              <=  0;
        r_font_height_pos       <=  0;
        if (!w_in_busy) begin
          r_read_char_count    	<=  0;
          //Don't start outputting the data until the in state is idle, otherwise we may get corrupted data
          r_read_addr           <=  r_start_frame_addr;
          out_state             <=  START_READ_FRAME_DELAY;
        end
      end
      START_READ_FRAME_DELAY: begin
        out_state               <=  GET_CHAR;
      end
      GET_CHAR: begin
        if (i_char_req_en) begin
          o_char_rdy            <=  1;
          if (r_read_width_pos < (CHAR_IMAGE_WIDTH - 1)) begin
            //Go to the next character positoin
            r_read_width_pos    <=  r_read_width_pos + 1;
            r_read_addr         <=  r_read_addr + 1;
          end
          else begin
            r_read_width_pos    <=  0;
            //if (r_font_height_pos < (FONT_HEIGHT - 1)) begin
            if (r_font_height_pos < (FONT_HEIGHT - 1)) begin
              //Go back to the beginning of the current line
              r_font_height_pos <=  r_font_height_pos + 1;
              r_read_addr       <=  r_read_addr - (CHAR_IMAGE_WIDTH - 1);
            end
            else begin
              //Go to the next character line
              r_read_addr       <=  r_read_addr + 1;
              r_font_height_pos <=  0;
              r_read_char_count <=  r_read_char_count + CHAR_IMAGE_WIDTH;
            end
          end
          out_state             <=  GET_CHAR_DELAY;
        end
      end
      GET_CHAR_DELAY: begin
        if (r_read_char_count < CHAR_IMAGE_SIZE) begin
          out_state             <= GET_CHAR;
        end
        else begin
          out_state             <=  IDLE;
        end

      end

      default: begin
      end
    endcase

    if (in_state == CLEAR_BUFFER) begin
      r_start_frame_addr      <=  r_curr_line_addr;
    end
    if (w_scroll_enable) begin
      r_start_frame_addr      <=  (w_next_line_addr - CHAR_IMAGE_SIZE);
    end
    if (i_read_frame_stb) begin
      out_state             <=  START_READ_FRAME;
    end
  end
end

endmodule
