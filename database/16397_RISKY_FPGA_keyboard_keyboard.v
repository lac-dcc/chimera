// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module keyboard
  
  (
    input wire clk, reset,
    input wire ps2d, ps2c,               // ps2 data and clock lines
    output wire [7:0] scan_code,         // scan_code received from keyboard to process
    output wire scan_code_ready,         // signal to outer control system to sample scan_code
    output wire letter_case_out          // output to determine if scan code is converted to lower or upper ascii code for a key
  );
  
  // constant declarations
  localparam  BREAK    = 8'hf0, // break code
    SHIFT1   = 8'h12, // first shift scan
    SHIFT2   = 8'h59, // second shift scan
    CAPS     = 8'h58; // caps lock
  
  // FSM symbolic states
  localparam [2:0] lowercase          = 3'b000, // idle, process lower case letters
    ignore_break       = 3'b001, // ignore repeated scan code after break code -F0- reeived
    shift              = 3'b010, // process uppercase letters for shift key held
    ignore_shift_break = 3'b011, // check scan code after F0, either idle or go back to uppercase
    capslock           = 3'b100, // process uppercase letter after capslock button pressed
    ignore_caps_break  = 3'b101; // check scan code after F0, either ignore repeat, or decrement caps_num
  
  
  // internal signal declarations
  reg [2:0] state_reg, state_next;           // FSM state register and next state logic
  wire [7:0] scan_out;                       // scan code received from keyboard
  reg got_code_tick;                         // asserted to write current scan code received to FIFO
  wire scan_done_tick;                       // asserted to signal that ps2_rx has received a scan code
  reg letter_case;                           // 0 for lower case, 1 for uppercase, outputed to use when converting scan code to ascii
  reg [7:0] shift_type_reg, shift_type_next; // register to hold scan code for either of the shift keys or caps lock
  reg [1:0] caps_num_reg, caps_num_next;     // keeps track of number of capslock scan codes received in capslock state (3 before going back to lowecase state)
  
  // instantiate ps2 receiver
  ps2_rx ps2_rx_unit (.clk(clk), .reset(reset), .rx_en(1'b1), .ps2d(ps2d), .ps2c(ps2c), .rx_done_tick(scan_done_tick), .rx_data(scan_out));
  
  // FSM stat, shift_type, caps_num register
  always @(posedge clk, posedge reset)
    if (reset)
      begin
      state_reg      <= lowercase;
      shift_type_reg <= 0;
      caps_num_reg   <= 0;
    end
    else
      begin
      state_reg      <= state_next;
      shift_type_reg <= shift_type_next;
      caps_num_reg   <= caps_num_next;
    end
  
  //FSM next state logic
  always @*
  begin
    
    // defaults
    got_code_tick   = 1'b0;
    letter_case     = 1'b0;
    caps_num_next   = caps_num_reg;
    shift_type_next = shift_type_reg;
    state_next      = state_reg;
    
    case(state_reg)
      
      // state to process lowercase key strokes, go to uppercase state to process shift/capslock
      lowercase:
      begin
        if(scan_done_tick)                                                                    // if scan code received
          begin
          if(scan_out == SHIFT1 || scan_out == SHIFT2)                                      // if code is shift
            begin
            shift_type_next = scan_out;                                                   // record which shift key was pressed
            state_next = shift;                                                           // go to shift state
          end
          
          else if(scan_out == CAPS)                                                         // if code is capslock
            begin
            caps_num_next = 2'b11;                                                        // set caps_num to 3, num of capslock scan codes to receive before going back to lowecase
            state_next = capslock;                                                        // go to capslock state
          end
          
          else if (scan_out == BREAK)                                                       // else if code is break code
            state_next = ignore_break;                                                    // go to ignore_break state
          
          else                                                                              // else if code is none of the above...
            got_code_tick = 1'b1;                                                         // assert got_code_tick to write scan_out to FIFO
        end
      end
      
      // state to ignore repeated scan code after break code FO received in lowercase state
      ignore_break:
      begin
        if(scan_done_tick)                                                                    // if scan code received,
          state_next = lowercase;                                                           // go back to lowercase state
      end
      
      // state to process scan codes after shift received in lowercase state
      shift:
      begin
        letter_case = 1'b1;                                                                   // routed out to convert scan code to upper value for a key
        
        if(scan_done_tick)                                                                    // if scan code received,
          begin
          if(scan_out == BREAK)                                                             // if code is break code
            state_next = ignore_shift_break;                                              // go to ignore_shift_break state to ignore repeated scan code after F0
          
          else if(scan_out != SHIFT1 && scan_out != SHIFT2 && scan_out != CAPS)             // else if code is not shift/capslock
            got_code_tick = 1'b1;                                                         // assert got_code_tick to write scan_out to FIFO
        end
      end
      
      // state to ignore repeated scan code after break code F0 received in shift state
      ignore_shift_break:
      begin
        if(scan_done_tick)                                                                // if scan code received
          begin
          if(scan_out == shift_type_reg)                                                // if scan code is shift key initially pressed
            state_next = lowercase;                                                   // shift/capslock key unpressed, go back to lowercase state
          else                                                                          // else repeated scan code received, go back to uppercase state
            state_next = shift;
        end
      end
      
      // state to process scan codes after capslock code received in lowecase state
      capslock:
      begin
        letter_case = 1'b1;                                                               // routed out to convert scan code to upper value for a key
        
        if(caps_num_reg == 0)                                                             // if capslock code received 3 times,
          state_next = lowercase;                                                   // go back to lowecase state
        
        if(scan_done_tick)                                                                // if scan code received
          begin
          if(scan_out == CAPS)                                                          // if code is capslock,
            caps_num_next = caps_num_reg - 1;                                         // decrement caps_num
          
          else if(scan_out == BREAK)                                                    // else if code is break, go to ignore_caps_break state
            state_next = ignore_caps_break;
          
          else if(scan_out != SHIFT1 && scan_out != SHIFT2)                             // else if code isn't a shift key
            got_code_tick = 1'b1;                                                     // assert got_code_tick to write scan_out to FIFO
        end
      end
      
      // state to ignore repeated scan code after break code F0 received in capslock state
      ignore_caps_break:
      begin
        if(scan_done_tick)                                                                // if scan code received
          begin
          if(scan_out == CAPS)                                                          // if code is capslock
            caps_num_next = caps_num_reg - 1;                                         // decrement caps_num
          state_next = capslock;                                                        // return to capslock state
        end
      end
      
    endcase
  end
  
  // output, route letter_case to output to use during scan to ascii code conversion
  assign letter_case_out = letter_case;
  
  // output, route got_code_tick to out control circuit to signal when to sample scan_out
  assign scan_code_ready = got_code_tick;
  
  // route scan code data out
  assign scan_code = scan_out;
  
endmodule
