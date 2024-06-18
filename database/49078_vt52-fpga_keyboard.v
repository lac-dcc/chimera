// This program was cloned from: https://github.com/AndresNavarro82/vt52-fpga
// License: GNU General Public License v3.0

module keyboard
  (input  clk,
   input  reset,
   input  ps2_data,
   input  ps2_clk,
   output reg [7:0] data,
   output reg valid,
   input ready
   );

   // state: one hot encoding
   // idle is the normal state, reading the ps/2 bus
   // key up/down (long and short) are for key events
   // keymap_read is for reading the keymap rom
   // esc_char is for sending ESC- prefixed chars
   localparam state_idle        = 5'b00001;
   localparam state_keymap      = 5'b00010;
   localparam state_key_down    = 5'b00100;
   localparam state_key_up      = 5'b01000;
   localparam state_esc_char    = 5'b10000;

   localparam esc = 8'h1b;

   localparam keycode_regular = 2'b0x;
   localparam keycode_modifier = 2'b10;
   localparam keycode_escaped = 2'b11;

   reg [4:0] state;

   reg [1:0] ps2_old_clks;
   reg [10:0] ps2_raw_data;
   reg [3:0]  ps2_count;
   reg [7:0]  ps2_byte;
   // we are processing a break_code (key up)
   reg ps2_break_keycode;
   // we are processing a long keycode (two bytes)
   reg ps2_long_keycode;
   // shift, control & meta key status, bit order:
   // lshift, lcontrol, lmeta, rmeta, rcontrol, rshift
   // alt/meta key status, vt52 doesn't have meta, but I want to use
   // emacs & can't stand that Esc- business, so alt sends esc+keypress
   reg [5:0] modifier_pressed;
   wire shift_pressed = modifier_pressed[5] || modifier_pressed[0];
   wire control_pressed = modifier_pressed[4] || modifier_pressed[1];
   wire meta_pressed = modifier_pressed[3] || modifier_pressed[2];
   // caps lock
   reg caps_lock_active;
   // keymap
   wire [10:0] keymap_address;
   wire [7:0] keymap_data;
   // special char to send after ESC
   reg [7:0] special_data;

   // ps2_byte is the actual keycode, we use long/short keycode, caps lock &
   // shift to determine the plane we need
   assign keymap_address = { ps2_long_keycode, caps_lock_active, shift_pressed, ps2_byte };

   // address is 3 bits for longkeycode/capslock/shift + 8 bits for keycode
   // data is on of
   // 0xxxxxxx: regular ASCII key
   // 10xxxxxx: control/meta/shift or caps lock, each bit is a key, all 0 for caps lock
   // 11xxxxxx: special key, ESC + upper case ASCII (clear msb to get char)
   keymap_rom keymap_rom(.clk(clk),
                         .addr(keymap_address),
                         .dout(keymap_data)
                         );

   // we don't need to do this on the pixel clock, we could use
   // something way slower, but it works
   always @(posedge clk) begin
      if (reset) begin
         state <= state_idle;

         data <= 0;
         valid <= 0;

         // the clk is usually high and pulled down to start
         ps2_old_clks <= 2'b00;
         ps2_raw_data <= 0;
         ps2_count <= 0;
         ps2_byte <= 0;

         ps2_break_keycode <= 0;
         ps2_long_keycode <= 0;

         modifier_pressed = 6'h00;
         caps_lock_active <= 0;

         special_data <= 0;
      end
      else if (valid && ready) begin
         // as soon as data is transmitted, clear valid
         valid <= 0;
      end
      else begin
        case (state)
          state_idle: begin
             ps2_old_clks <= {ps2_old_clks[0], ps2_clk};
             if(ps2_clk && ps2_old_clks == 2'b01) begin
                // clock edge detected, read another bit
                if(ps2_count == 10) begin
                   // 11 bits means we are done (XXX/TODO check parity and stop bits)
                   ps2_count <= 0;
                   ps2_byte <= ps2_raw_data[10:3];
                   // handle the breaks & long keycodes and only change to
                   // keycode state if a complete keycode is already received
                   if (ps2_raw_data[10:3] == 8'he0) begin
                      ps2_break_keycode <= 0;
                      ps2_long_keycode <= 1;
                   end
                   else if (ps2_raw_data[10:3] == 8'hf0) begin
                      ps2_break_keycode <= 1;
                   end
                   else begin
                      state <= state_keymap;
                   end
                end
                else begin
                   // the data comes lsb first
                   ps2_raw_data <= {ps2_data, ps2_raw_data[10:1]};
                   ps2_count <= ps2_count + 1;
                end
             end
          end
          state_keymap: begin
             // after reading the keymap we can finally process the key
             state <= ps2_break_keycode? state_key_up : state_key_down;
          end
          state_key_up: begin
             // on key up we only care about released modifiers
             ps2_break_keycode <= 0;
             ps2_long_keycode <= 0;
             state <= state_idle;
             if (keymap_data[7:6] == keycode_modifier) begin
                // the released modifier is in keymap_data[5:0]
                // or 0 for caps lock
                modifier_pressed <= modifier_pressed & ~keymap_data[5:0];
             end
          end
          state_key_down: begin
             ps2_long_keycode <= 0;
             if (keymap_data == 0) begin
                // unrecognized key, just go back to idle
                state <= state_idle;
             end
             else begin
                casex (keymap_data[7:6])
                  keycode_regular: begin
                     // regular key, apply modifiers:
                     // control turns off 7th & 6th bits
                     // meta sends an ESC prefix
                     if (meta_pressed) begin
                        data <= esc;
                        valid <= 1;
                        state <= state_esc_char;
                        special_data <= {
                                         1'b0,
                                         control_pressed? 2'b00 : keymap_data[6:5],
                                         keymap_data[4:0]
                                         };
                     end
                     else begin
                        data <= {
                                 1'b0,
                                 control_pressed? 2'b00 : keymap_data[6:5],
                                 keymap_data[4:0]
                                 };
                        valid <= 1;
                        state <= state_idle;
                     end
                  end
                  keycode_escaped: begin
                     // escaped char, send Esc- and then the ascii value
                     // including the leading 1 (only uppercase, lowercase and some symbols allowed)
                     data <= esc;
                     valid <= 1;
                     state <= state_esc_char;
                     special_data <= {
                                      1'b0,
                                      control_pressed? 2'b00 : keymap_data[6:5],
                                      keymap_data[4:0]
                                      };
                  end
                  keycode_modifier: begin
                     // the pressed modifier is in keymap_data[5:0], or 0 for caps lock
                     state <= state_idle;
                     modifier_pressed <= modifier_pressed | keymap_data[5:0];
                     caps_lock_active <= caps_lock_active ^ ~|keymap_data[5:0];
                  end
                endcase
             end // else: !if(keymap_data == 0)
          end // case: state_keymap_down
          state_esc_char: begin
             // only send special char after ESC was successfully sent
             if (valid == 0) begin
                state <= state_idle;
                data <= {
                         1'b0,
                         control_pressed? 2'b00 : special_data[6:5],
                         special_data[4:0]
                         };
                valid <= 1;
             end
          end
        endcase // case (state)
      end // else: !if(valid && ready)
   end // always @ (posedge clk)
endmodule
