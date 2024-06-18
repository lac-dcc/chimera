// This program was cloned from: https://github.com/jorgenkraghjakobsen/tt06-toi2s
// License: Apache License 2.0

module amp_state_control (
    input clk_in,
    input resetb,
    input audio_locked_in,
    input nerror_in,
    output nenable_out, 
    output nmute_out,
    output send_config_out
  );
  
  wire mute;
  wire enable_delayed; 
  wire timer_timeout;
  reg send_config;  
  reg send_config_delayed;
  reg timer_start;
  reg nenable_reg;

  
  timer_simple tim(
      .clk_in(clk_in),
      .resetb(resetb),
      .timer_start(timer_start),
      .timer_timeout(timer_timeout)); 

  localparam [3:0] // Amp states 
    INIT_ST          = 4'b0000,
    ENABLED_0_ST     = 4'b0001,
    ENABLED_1_ST     = 4'b0010,
    ENABLED_WAIT_ST  = 4'b0011,
    SEND_CFG_0_ST    = 4'b0100,
    SEND_CFG_1_ST    = 4'b0101,
    SEND_CFG_WAIT_ST = 4'b0110,
    UNMUTE_ST        = 4'b0111;

   
  reg [3:0] amp_state_reg; //,  amp_state_next; 
  
  always @(posedge clk_in)
  begin 
    if (!resetb) 
      amp_state_reg = INIT_ST;       
    else 
      case (amp_state_reg) 
        INIT_ST: // Startup system 
            amp_state_reg      = ENABLED_0_ST; 
        ENABLED_0_ST: 
            amp_state_reg      = ENABLED_1_ST; 
        ENABLED_1_ST: 
            amp_state_reg      = ENABLED_WAIT_ST; 
        ENABLED_WAIT_ST: 
            if (timer_timeout) 
              amp_state_reg   = SEND_CFG_0_ST;
            else 
              amp_state_reg   = ENABLED_WAIT_ST;   
        SEND_CFG_0_ST:
            amp_state_reg    = SEND_CFG_1_ST; 
        SEND_CFG_1_ST:
            amp_state_reg   = SEND_CFG_WAIT_ST; 
        SEND_CFG_WAIT_ST: 
            if (timer_timeout) 
              amp_state_reg = UNMUTE_ST; 
            else  
              amp_state_reg = SEND_CFG_WAIT_ST; 
        UNMUTE_ST: 
             amp_state_reg = UNMUTE_ST; 
        // default:
        //   amp_state_reg = INIT_ST;
      endcase      
  end 

  always @(*)
  begin  
    case(amp_state_reg) 
      INIT_ST : // Startup system 
        begin
          send_config         = 1'b0;  
          send_config_delayed = 1'b0;
          nenable_reg         = 1'b1;
          timer_start         = 1'b0;
        end
      ENABLED_0_ST : 
        begin
         send_config         = 1'b0;  
         send_config_delayed = 1'b0;
         nenable_reg         = 1'b0;
         timer_start         = 1'b1;   
        end 
      ENABLED_1_ST : 
        begin 
         send_config         = 1'b0;  
         send_config_delayed = 1'b0;
         nenable_reg         = 1'b0;
         timer_start         = 1'b0;   
        end 
      
      ENABLED_WAIT_ST : 
        begin 
         send_config         = 1'b0;  
         send_config_delayed = 1'b0;
         nenable_reg         = 1'b0;
         timer_start         = 1'b0;   
        end

      SEND_CFG_0_ST :
        begin
          send_config         = 1'b1;  
          send_config_delayed = 1'b0;
          nenable_reg         = 1'b0;
          timer_start         = 1'b1;
        end
      
      SEND_CFG_1_ST :
        begin
          send_config         = 1'b1;  
          send_config_delayed = 1'b0;
          nenable_reg         = 1'b0;
          timer_start         = 1'b0;
        end
      
      SEND_CFG_WAIT_ST : 
        begin
          send_config         = 1'b1;  
          send_config_delayed = 1'b0;
          nenable_reg         = 1'b0;
          timer_start         = 1'b0;
        end

      UNMUTE_ST: 
        begin
         send_config         = 1'b1;  
         send_config_delayed = 1'b1;
         nenable_reg         = 1'b0;
         timer_start         = 1'b0;
        end
      
      default:
        begin
          send_config         = 1'b1;  
          send_config_delayed = 1'b1;
          nenable_reg         = 1'b0;
          timer_start         = 1'b0;
        end
    endcase
  end 
  assign nenable_out = nenable_reg ; 
  assign mute      = ~audio_locked_in | ~send_config_delayed;  
  assign nmute_out = ~mute;  
  assign send_config_out = send_config; 
endmodule
