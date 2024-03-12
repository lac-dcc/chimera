// TODO define constants for the control chars
module command_handler
  #(parameter ROWS = 24,
    parameter COLS = 80,
    parameter LAST_ROW = (ROWS-1) * COLS,
    parameter ONE_PAST_LAST_ROW = ROWS * COLS,
    parameter ROW_BITS = 5,
    parameter COL_BITS = 7,
    parameter ADDR_BITS = 11)
   (
    input clk,
    input reset,
    input [7:0] data,
    input valid,
    output ready,
    output [ADDR_BITS-1:0] new_first_char,
    output new_first_char_wen,
    output [7:0] new_char,
    output [ADDR_BITS-1:0] new_char_address,
    output new_char_wen,
    output [COL_BITS-1:0] new_cursor_x,
    output [ROW_BITS-1:0] new_cursor_y,
    output new_cursor_wen
    );

   // XXX maybe ready should be registered? reg ready_q;
   reg [7:0] new_char_q;
   reg [ADDR_BITS-1:0] new_char_address_q;
   reg new_char_wen_q;
   reg [COL_BITS-1:0] new_cursor_x_q;
   reg [ROW_BITS-1:0] new_cursor_y_q;
   reg new_cursor_wen_q;
   reg [ADDR_BITS-1:0] new_first_char_q;
   reg new_first_char_wen_q;

   reg [ROW_BITS-1:0] new_row;
   reg [COL_BITS-1:0] new_col;
   // This may temporarily hold a value that's twice the size of a regular
   // address (we adjust it at a later state)
   // so we DON'T substract 1 from ADDR_BITS
   reg [ADDR_BITS:0] new_addr;
   reg [ADDR_BITS-1:0] last_char_to_erase;

   reg [ADDR_BITS-1:0] current_row_addr;
   reg [ADDR_BITS-1:0] current_char_addr;

   // state: one hot encoding
   // char is the normal state
   // row, col, addr & cursor form a pipeline for Esc-Y
   // no input accepted on addr & cursor
   // erase is for the erase loop, no input is accepted on this state
   localparam state_char   = 8'b00000001;
   localparam state_esc    = 8'b00000010;
   localparam state_row    = 8'b00000100;
   localparam state_col    = 8'b00001000;
   localparam state_addr   = 8'b00010000;
   localparam state_cursor = 8'b00100000;
   localparam state_erase  = 8'b01000000;

   reg [7:0] state;

   // if we are erasing part of the screen or moving the cursor
   // we can't receive new commands
   assign ready = (state & (state_erase | state_cursor | state_addr)) == 0;
   assign new_char = new_char_q;
   assign new_char_address = new_char_address_q;
   assign new_char_wen = new_char_wen_q;
   assign new_cursor_x = new_cursor_x_q;
   assign new_cursor_y = new_cursor_y_q;
   assign new_cursor_wen = new_cursor_wen_q;
   assign new_first_char = new_first_char_q;
   assign new_first_char_wen = new_first_char_wen_q;

   always @(posedge clk) begin
      if (reset) begin
         new_char_q <= 0;
         new_char_address_q <= 0;
         new_char_wen_q <= 0;

         new_cursor_x_q <= 0;
         new_cursor_y_q <= 0;
         new_cursor_wen_q <= 0;

         current_row_addr <= 0;
         current_char_addr <= 0;

         new_first_char_q <= 0;
         new_first_char_wen_q <= 0;

         state <= state_char;
         new_row <= 0;
         new_col <= 0;
         new_addr <= 0;
         last_char_to_erase <= 0;
      end
      else begin
         // after one clock cycle we should turn these off
         if (new_char_wen_q) new_char_wen_q <= 0;
         if (new_cursor_wen_q) new_cursor_wen_q <= 0;
         if (new_first_char_wen_q) new_first_char_wen_q <= 0;
         // first the states that consume input
         if (ready && valid) begin
            case (state)
              state_char: begin
                 // new char arrived
                 if (data >= 8'h20 && data != 8'h7f) begin
                    // printable char, easy
                    new_char_q <= data;
                    new_char_address_q <= current_char_addr;
                    new_char_wen_q <= 1;
                    // no auto linefeed
                    if (new_cursor_x_q != (COLS-1)) begin
                       new_cursor_x_q <= new_cursor_x_q + 1;
                       current_char_addr <= current_char_addr + 1;
                       new_cursor_wen_q <= 1;
                    end
                 end
                 else begin
                    case (data)
                      // backspace
                      8'h08: begin
                         if (new_cursor_x_q != 0) begin
                            new_cursor_x_q <= new_cursor_x_q - 1;
                            current_char_addr <= current_char_addr - 1;
                            new_cursor_wen_q <= 1;
                         end
                      end
                      // tab
                      8'h09: begin
                         // go until the last tab stop by 8 spaces, then 1 by 1
                         if (new_cursor_x_q < (COLS-9)) begin
                            new_cursor_x_q <= {(new_cursor_x_q[COL_BITS-1:3]+1), 3'b000};
                            current_char_addr <= {(current_char_addr[ADDR_BITS-1:3]+1), 3'b000};
                            new_cursor_wen_q <= 1;
                         end
                         else if (new_cursor_x_q != (COLS-1)) begin
                            new_cursor_x_q <= new_cursor_x_q + 1;
                            current_char_addr <= current_char_addr + 1;
                            new_cursor_wen_q <= 1;
                         end
                      end // case: 8'h09
                      // linefeed
                      8'h0a: begin
                         if (new_cursor_y_q == (ROWS-1)) begin
                            new_first_char_q <= new_first_char_q == LAST_ROW?
                                                0 : new_first_char_q + COLS;

                            if (current_row_addr == LAST_ROW) begin
                               current_row_addr <= 0;
                               current_char_addr <= new_cursor_x_q;
                            end
                            else begin
                               current_row_addr <= current_row_addr + COLS;
                               current_char_addr <= current_char_addr + COLS;
                            end
                            new_first_char_wen_q <= 1;
                            // characters to erase last line
                            new_char_q <= " ";
                            new_char_address_q <= new_first_char_q;
                            new_char_wen_q <= 1;
                            last_char_to_erase <= new_first_char_q + (COLS-1);
                            state <= state_erase;
                         end
                         else begin
                            new_cursor_y_q <= new_cursor_y_q + 1;
                            new_cursor_wen_q <= 1;
                            if (current_row_addr == LAST_ROW) begin
                               current_row_addr <= 0;
                               current_char_addr <= new_cursor_x_q;
                            end
                            else begin
                               current_row_addr <= current_row_addr + COLS;
                               current_char_addr <= current_char_addr + COLS;
                            end
                         end
                      end
                      // carriage return
                      8'h0d: begin
                         if (new_cursor_x != 0) begin
                            new_cursor_x_q <= 0;
                            new_cursor_wen_q <= 1;
                            current_char_addr <= current_row_addr;
                         end
                      end
                      // escape
                      8'h1b: begin
                         state <= state_esc;
                      end
                    endcase // case (data)
                 end // else: !if(data >= 8'h20 && data <= 8'h7e)
              end // case: state_char
              state_esc: begin
                 case (data)
                   // Basic cursor movement
                   // Esc-only, so no BS, LF & SPACE (covered before)
                   "B": begin
                      if (new_cursor_y_q != (ROWS-1)) begin
                         new_cursor_y_q <= new_cursor_y_q + 1;
                         new_cursor_wen_q <= 1;
                         if (current_row_addr == LAST_ROW) begin
                            current_row_addr <= 0;
                            current_char_addr <= new_cursor_x_q;
                         end
                         else begin
                            current_row_addr <= current_row_addr + COLS;
                            current_char_addr <= current_char_addr + COLS;
                         end
                      end
                      state <= state_char;
                   end
                   "I": begin
                      if (new_cursor_y_q == 0) begin
                         if (new_first_char_q == 0) begin
                            new_first_char_q <= LAST_ROW;
                            current_row_addr <= LAST_ROW;
                            current_char_addr <= LAST_ROW + new_cursor_x_q;
                            // characters to erase (whole line)
                            new_char_address_q <= LAST_ROW;
                            last_char_to_erase <= LAST_ROW+(COLS-1);
                         end
                         else begin
                            new_first_char_q <= new_first_char_q - COLS;
                            current_row_addr <= current_row_addr - COLS;
                            current_char_addr <= current_char_addr - COLS;
                            // characters to erase (whole line)
                            new_char_address_q <= new_first_char_q - COLS;
                            last_char_to_erase <= new_first_char_q - 1;
                         end
                         new_first_char_wen_q <= 1;
                         // character to erase last line
                         new_char_q <= " ";
                         new_char_wen_q <= 1;
                         state <= state_erase;
                      end
                      else begin
                         new_cursor_y_q <= new_cursor_y_q - 1;
                         new_cursor_wen_q <= 1;
                         if (current_row_addr == 0) begin
                            current_row_addr <= LAST_ROW;
                            current_char_addr <= LAST_ROW + new_cursor_x_q;
                         end
                         else begin
                            current_row_addr <= current_row_addr - COLS;
                            current_char_addr <= current_char_addr - COLS;
                         end
                         state <= state_char;
                      end
                   end
                   "A": begin
                      if (new_cursor_y_q != 0) begin
                         new_cursor_y_q <= new_cursor_y_q - 1;
                         new_cursor_wen_q <= 1;
                         if (current_row_addr == 0) begin
                            current_row_addr <= LAST_ROW;
                            current_char_addr <= LAST_ROW + new_cursor_x_q;
                         end
                         else begin
                            current_row_addr <= current_row_addr - COLS;
                            current_char_addr <= current_char_addr - COLS;
                         end
                      end
                      state <= state_char;
                   end
                   "C": begin
                      if (new_cursor_x_q != (COLS-1)) begin
                         new_cursor_x_q <= new_cursor_x_q + 1;
                         new_cursor_wen_q <= 1;
                         current_char_addr <= current_char_addr+1;
                      end
                      state <= state_char;
                   end
                   "D": begin
                      if (new_cursor_x_q != 0) begin
                         new_cursor_x_q <= new_cursor_x_q - 1;
                         new_cursor_wen_q <= 1;
                         current_char_addr <= current_char_addr-1;
                      end
                      state <= state_char;
                   end
                   // Advanced cursor movement
                   // Esc-only, so no CR & TAB (covered before)
                   "H": begin
                      new_cursor_x_q <= 0;
                      new_cursor_y_q <= 0;
                      new_cursor_wen_q <= 1;
                      current_row_addr <= new_first_char_q;
                      current_char_addr <= new_first_char_q;
                      state <= state_char;
                   end
                   "Y": begin
                      // "Y" received, expecting row & col
                      state <= state_row;
                   end
                   // Screen erasure
                   "K": begin
                      // erase to end of line
                      new_char_q <= " ";
                      new_char_address_q <= current_char_addr;
                      new_char_wen_q <= 1;
                      last_char_to_erase <= current_row_addr + (COLS-1);
                      state <= state_erase;
                   end
                   "J": begin
                      // erase to end of screen
                      new_char_q <= " ";
                      new_char_address_q <= current_char_addr;
                      new_char_wen_q <= 1;
                      last_char_to_erase <= new_first_char_q == 0?
                                            LAST_ROW+(COLS-1): new_first_char_q-1;
                      state <= state_erase;
                   end
                   // escape
                   8'h1b: begin
                      // on VT52 two escapes don't cancel each other
                      // do nothing
                   end
                   default: begin
                      // unrecognized escape sequence, back to normal
                      state <= state_char;
                   end
                 endcase // case (data)
              end // case: state_esc
              state_row: begin
                 // row received, now we need col
                 new_row <= (data >= 8'h20 && data < (8'h20 + ROWS))?
                            data - 8'h20 : new_cursor_y;
                 state <= state_col;
              end
              state_col: begin
                 // row & col received, now we need to calculate the new row address
                 // XXX I'm not sure what happens if data < 8'h20, this is a guess
                 new_col <= (data >= 8'h20 && data < (8'h20 + COLS))?
                            data - 8'h20 : (COLS-1);
                 // this may need substracting if it's more than LAST_ROW
                 // but we'll do it in the next state
                 // new_addr has an extra bit to avoid overflows
                 new_addr <= new_row * 80 + new_first_char_q;
                 state <= state_addr;
              end
              // states erase, addr & cursor aren't here as they don't consume input
            endcase // case (state)
         end // if (ready && valid)
         // now we can handle the states that don't consume input
         else begin
            case (state)
              state_erase: begin
                 if (new_char_address_q == last_char_to_erase) begin
                    // all chars erased, resume normal operation
                    state <= state_char;
                 end
                 else begin
                    // keep erasing, but be careful if reaching the end of the buffer
                    new_char_address_q = new_char_address_q == LAST_ROW + (COLS+1)?
                                         0 : new_char_address_q + 1;
                    new_char_wen_q <= 1;
                 end
              end
              state_addr: begin
                 // after possibly adjusting the address we are ready to
                 // move the cursor
                 new_addr <= new_addr > LAST_ROW? new_addr - ONE_PAST_LAST_ROW : new_addr;
                 state <= state_cursor;
              end
              state_cursor: begin
                 // move cursor and go back to idle
                 new_cursor_x_q <= new_col;
                 new_cursor_y_q <= new_row;
                 new_cursor_wen_q <= 1;
                 // once adjusted, we can ignore the higher bit
                 current_row_addr <= new_addr[ADDR_BITS-1:0];
                 current_char_addr <= new_addr + new_col;

                 state <= state_char;
              end // if (state == state_col)
            endcase // case (state)
         end // else: !if(ready && valid)
      end // else: !if(reset)
   end // always @ (posedge clk)
endmodule
