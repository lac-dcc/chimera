// This program was cloned from: https://github.com/abdelazeem201/SoC-FPGA
// License: MIT License

//*********************************************************************
//*  SoC based ASIC Fresh Board                                       *
//*          digital clock                                            *
//*  Top File : clock.v                                               *
//*  Author: Abdelazeem                                               *
//*  Revision 0.1                                                     *
//*  Date     2023/12/11                                              *
//*  Email : a.abdelazeem201@gmail.com                                 *        
//*********************************************************************
//`define SIM
module clock(
             clk,
             modify_n,
             plus_n,
             pulld,
             dig,
             a,
             b,
             c,
             d,
             e,
             f,
             g,
             point
             );
input  clk;
input  modify_n;
input  plus_n;
output pulld;
output [3:0] dig;
output a;
output b;
output c;
output d;
output e;
output f;
output g;
output point;
         
reg [6:0]  reg_seg;               
reg [6:0] reg_minl,reg_minh;
reg [6:0] reg_hourl,reg_hourh;

reg reg_point;

reg reg_reset_n;
wire reg_hour_flag;
wire reg_1min_flag;
wire reg_1s_flag;
wire reg_ms_flag;
wire reg_us_flag;
wire reg_us_4flag;

reg [3:0] reg_dig;
reg [4:0] reg_hour_count;
reg [5:0] reg_min_count;
reg [5:0] reg_s_count;
reg [9:0] reg_ms_count;
reg [9:0] reg_us_count;
reg [5:0] reg_clk_count;
 parameter   seg0   =7'h40,
             seg1   =7'h79,
             seg2   =7'h24,
             seg3   =7'h30,
             seg4   =7'h19,
             seg5   =7'h12,
             seg6   =7'h02,
             seg7   =7'h78,
             seg8   =7'h00,
             seg9   =7'h10;
assign a =  reg_seg[0];
assign b =  reg_seg[1];
assign c =  reg_seg[2];
assign d =  reg_seg[3];
assign e =  reg_seg[4];
assign f =  reg_seg[5];
assign g =  reg_seg[6];

parameter  S_CLOCK    = 2'b00;
parameter  S_HOUR     = 2'b01;
parameter  S_MINUTE   = 2'b11;

reg [1:0] reg_cnt_3scd;
reg [3:0] reg_cnt_15scd;

reg [3:0] reg_min_l;
reg [2:0] reg_min_h;
reg [3:0] reg_hour_l;
reg [4:0] reg_hour_h;
reg [1:0] state_current;
reg [1:0] state_next;
wire key_mode;
reg reg1_modify;
reg reg1_plus;
reg reg_key_mode;
reg reg_key_mode1;
reg reg_key_t;
reg reg_key_minus;
reg reg2_plus;
reg [7:0] reg_cnt_xms;
reg [7:0] reg_cnt1_xms;
wire flash;
reg reg_flash;

assign pulld =1'b0; // pulldown the key when the key is pushing down
assign dig  = reg_dig;
assign point   = reg_point;

//______ reset _______________
always @(posedge clk) 
begin 
	if (( plus_n == 1'b0) && (modify_n == 1'b0))
	   reg_reset_n <= 1'b0 ;
	else 
	   reg_reset_n <= 1'b1 ;
end

// ______________ scan for displaying ______________
reg [3:0] count_ms;
reg clk_scan;
reg [1:0] scan_cnt;
always @(posedge clk)
begin
  if (~reg_reset_n)
     count_ms <= 4'h0;
  else 
  begin
  	 if( (reg_ms_flag == 1'b1) && (count_ms == 4'h2)) count_ms <= 4'h0;
     else  if( (reg_ms_flag == 1'b1) ) count_ms <= count_ms + 1;
  end
end

always @(posedge clk)
begin
  if (~reg_reset_n)
     clk_scan <= 1'h0;
  else  if( (reg_ms_flag == 1'b1) && (count_ms == 4'h2)) 
     clk_scan <= ~clk_scan;
end

always @(posedge clk_scan)          
     begin 
       if (~reg_reset_n)
         scan_cnt <= 0 ;
       else  
         begin
     	      if(scan_cnt==2'd3)  
     	        scan_cnt <= 0;   
            else  scan_cnt <= scan_cnt + 1;  
         end 
     end
     
always @(posedge clk_scan)  
  begin                    
    	if (~reg_reset_n)     
    reg_dig <= 4'h0; 
     else
       begin 
         case ( scan_cnt )    
             2'b00 : reg_dig <= 4'b0001;
             2'b01 : reg_dig <= 4'b0010;
             2'b10 : reg_dig <= 4'b0100;
             2'b11 : reg_dig <= 4'b1000;   
         endcase
       end
   end
   
always @(posedge clk)         
     begin 
       	if (~reg_reset_n)
       reg_seg <= 7'h0;
       else
         begin
           case ( reg_dig )    
               4'b0001 : reg_seg <=  reg_hourh ;
               4'b0010 : reg_seg <=  reg_hourl ;
               4'b0100 : reg_seg <=  reg_minh;
               4'b1000 : reg_seg <=  reg_minl;
               default : reg_seg <= reg_seg;    
           endcase
         end
     end

  `ifdef SIM
    assign flash = ((reg_ms_count == 49) || (reg_ms_count == 99)) && (reg_ms_flag == 1'b1) ;
  `else
    assign flash = ((reg_ms_count == 499) || (reg_ms_count == 999)) && (reg_ms_flag == 1'b1) ;
  `endif

always @(posedge clk)
begin
  if (~reg_reset_n)
     reg_flash <= 1'b0;
  else 
    begin
    	if(flash == 1'b1)
    	  reg_flash <= ~reg_flash;
    end
end

always @(posedge clk)
begin
  if (~reg_reset_n)
     reg_point <= 1'b1;
  else  
  begin
      case ( reg_dig )
          4'b0001 : reg_point <= (state_current == S_HOUR) ? reg_flash  : 1'b1;
          4'b0010 : reg_point <= (state_current == S_CLOCK) ? reg_flash : 1'b1; 
          4'b0100 : reg_point <=  1'b1;
          4'b1000 : reg_point <= (state_current == S_MINUTE) ? reg_flash  : 1'b1;
          default : reg_point <= reg_point;
      endcase
  end
end
//_______  reg_minl，reg_minh，reg_hourl，reg_hourh ________________
always @(posedge clk)
 begin
    if (~reg_reset_n)
         reg_minl <= 7'b0;
    else
    begin    
    	case(reg_min_count)   
        6'd0,6'd10,6'd20,6'd30,6'd40,6'd50 : reg_minl <= seg0;
        6'd1,6'd11,6'd21,6'd31,6'd41,6'd51 : reg_minl <= seg1;
        6'd2,6'd12,6'd22,6'd32,6'd42,6'd52 : reg_minl <= seg2;
        6'd3,6'd13,6'd23,6'd33,6'd43,6'd53 : reg_minl <= seg3;
        6'd4,6'd14,6'd24,6'd34,6'd44,6'd54 : reg_minl <= seg4;
        6'd5,6'd15,6'd25,6'd35,6'd45,6'd55 : reg_minl <= seg5;
        6'd6,6'd16,6'd26,6'd36,6'd46,6'd56 : reg_minl <= seg6;
        6'd7,6'd17,6'd27,6'd37,6'd47,6'd57 : reg_minl <= seg7;
        6'd8,6'd18,6'd28,6'd38,6'd48,6'd58 : reg_minl <= seg8;
        6'd9,6'd19,6'd29,6'd39,6'd49,6'd59 : reg_minl <= seg9;
        default  :  reg_minl <= reg_minl; 
      endcase   
    end  
 end
always @(posedge clk)
  begin
    if (~reg_reset_n)
       reg_minh <= 7'b0;
       else
          begin    
            	case(reg_min_count)   
                6'd0,6'd1,6'd2,6'd3,6'd4,6'd5,6'd6,6'd7,6'd8,6'd9 : reg_minh <=seg0;
                6'd10,6'd11,6'd12,6'd13,6'd14,6'd15,6'd16,6'd17,6'd18,6'd19 : reg_minh <= seg1;
                6'd20,6'd21,6'd22,6'd23,6'd24,6'd25,6'd26,6'd27,6'd28,6'd29 : reg_minh <= seg2;
                6'd30,6'd31,6'd32,6'd33,6'd34,6'd35,6'd36,6'd37,6'd38,6'd39 : reg_minh <= seg3;
                6'd40,6'd41,6'd42,6'd43,6'd44,6'd45,6'd46,6'd47,6'd48,6'd49 : reg_minh <= seg4;
                6'd50,6'd51,6'd52,6'd53,6'd54,6'd55,6'd56,6'd57,6'd58,6'd59 : reg_minh <= seg5;
                default  :  reg_minh <= reg_minh; 
              endcase   
          end
  end


always @(posedge clk)
 begin    
     if (~reg_reset_n)
        reg_hourl <= 7'b0;
        else
         begin
 	            case(reg_hour_count)   
                5'd0,5'd10,5'd20 : reg_hourl <= seg0;
                5'd1,5'd11,5'd21 : reg_hourl <= seg1;
                5'd2,5'd12,5'd22 : reg_hourl <= seg2;
                5'd3,5'd13,5'd23 : reg_hourl <= seg3;
                5'd4,5'd14 : reg_hourl <= seg4;
                5'd5,5'd15 : reg_hourl <= seg5;
                5'd6,5'd16 : reg_hourl <= seg6;
                5'd7,5'd17 : reg_hourl <= seg7;
                5'd8,5'd18 : reg_hourl <= seg8;
                5'd9,5'd19 : reg_hourl <= seg9;
                default :   reg_hourl <= reg_hourl; 
 	            endcase   
 	       end
 end
always @(posedge clk)
  begin    
  	if (~reg_reset_n)
          reg_hourh <= 7'b0;
          else
          begin
  	          case(reg_hour_count)   
               5'd0,5'd1,5'd2,5'd3,5'd4,5'd5,5'd6,5'd7,5'd8,5'd9 : reg_hourh <=seg0;
               5'd10,5'd11,5'd12,5'd13,5'd14,5'd15,5'd16,5'd17,5'd18,5'd19 : reg_hourh <=seg1;
               5'd20,5'd21,5'd22,5'd23 : reg_hourh <=seg2;
               default  :  reg_hourh <= reg_hourh; 
  	          endcase  
  	      end
  end

//______________/* 24 hours */__________________
///*clk counter, cleared when counting 50 clocks (50MHZ clock, period is 20ns), that is, 1000ns = 1 microsecond*/
always @(posedge clk)
begin
  if (~reg_reset_n)
     reg_clk_count <= 6'h0;
  else 
    begin
    	 `ifdef SIM
         if( reg_clk_count == 9) reg_clk_count <= 5'h0;
       `else
         if( reg_clk_count == 49) reg_clk_count <= 6'h0;
       `endif
         else  reg_clk_count <= reg_clk_count + 1;
    end
end
`ifdef SIM
assign reg_us_flag = (reg_clk_count == 9) ;
`else
assign reg_us_flag = (reg_clk_count == 49) ;
`endif

///*us counter, cleared when it reaches 1000us, which is 1 millisecond*/
always @(posedge clk)
begin
  if (~reg_reset_n)
     reg_us_count <= 0;
  else  
  begin
    `ifdef SIM
          if( (reg_us_count == 9)&&(reg_us_flag == 1'b1)) reg_us_count <= 10'h000;
    `else
          if((reg_us_count == 999) && (reg_us_flag == 1'b1)) reg_us_count <= 10'h000;
    `endif
    else if( reg_us_flag == 1'b1) reg_us_count <= reg_us_count + 1;
  end
end
 
//Generate 1ms flag reg_ms_flag

 `ifdef SIM
    assign reg_ms_flag = (reg_us_count == 9) && (reg_us_flag == 1'b1);
 `else
   assign reg_ms_flag = (reg_us_count == 999) && (reg_us_flag == 1'b1);
 `endif

//ms counter, cleared when it reaches 1000ms, which is 1 second
always @(posedge clk)
begin
  if (~reg_reset_n)
     reg_ms_count <= 0;
  else 
  begin
  	`ifdef SIM
        if((reg_ms_count == 9) && (reg_ms_flag == 1)) reg_ms_count <= 10'h000;
     `else 
        if((reg_ms_count == 999) && (reg_ms_flag == 1)) reg_ms_count <= 10'h000;
      `endif  
      else if( reg_ms_flag) reg_ms_count <= reg_ms_count + 1;
    end
end

//Generate 1s flag reg_1s_flag
`ifdef SIM
assign reg_1s_flag = (reg_ms_count == 9) && (reg_ms_flag == 1);
`else
assign reg_1s_flag = (reg_ms_count == 999) && (reg_ms_flag == 1);
`endif


// The second counter is cleared to 0 when it reaches 60 seconds, which is one minute.
always @(posedge clk)
begin
  if (~reg_reset_n)
     reg_s_count <= 6'b000000;
  else 
  begin
  	 `ifdef SIM
  	 if((reg_s_count == 9) && (reg_1s_flag == 1)) reg_s_count <= 6'b000000;
  	 `else
  	 if((reg_s_count == 59) && (reg_1s_flag == 1)) reg_s_count <= 6'b000000;
  	 `endif
     else  if(reg_1s_flag == 1'b1) reg_s_count <= reg_s_count + 1;  
  end
end

// Generate 1 minute mark
assign reg_1min_flag = (reg_s_count == 59)&& (reg_1s_flag == 1);

// The minute counter is cleared to 0 when it reaches 60 minutes, which is 1 hour.
always @(posedge clk)
  begin
    if (~reg_reset_n)
       reg_min_count <= 6'b000000;
    else
    begin
       	if((reg_min_count == 6'd59 ) && ((reg_1min_flag == 1'b1) || ((reg2_plus == 1'b0) && (state_current == S_MINUTE)))) reg_min_count <= 6'b000000;
       else  if((reg_min_count != 6'd59 ) && (((reg2_plus == 1'b0) && (state_current == S_MINUTE)) || (reg_1min_flag == 1'b1))) 
         reg_min_count <= reg_min_count + 1'b1; 
       else  if((reg_key_minus == 1'b0) && (state_current == S_MINUTE) && (reg_min_count == 6'b0)) reg_min_count <= 59;   
       else  if((reg_key_minus == 1'b0) && (state_current == S_MINUTE) && (reg_min_count != 6'b0)) reg_min_count <= reg_min_count - 1'b1;    
    end
  end
  // Generate 1 hour mark
assign reg_hour_flag = (reg_min_count == 6'd59) && (reg_1min_flag == 1'b1);

//The hour counter is cleared to 0 when it reaches 24 hours, which is 1 day.
always @(posedge clk)
begin
  if (~reg_reset_n)
     reg_hour_count <= 5'b00000;
  else 
  begin
    	 if((reg_hour_count == 23) && ((reg_hour_flag ==1'b1) || ((reg2_plus == 1'b0) && (state_current == S_HOUR)))) 
            reg_hour_count <= 5'b00000;
    else  if((reg_hour_count != 23) && ((reg_hour_flag ==1'b1) || ((reg2_plus == 1'b0) && (state_current == S_HOUR)))) 
            reg_hour_count <= reg_hour_count + 1'b1; 
    else  if((reg_key_minus == 1'b0) && (state_current == S_HOUR) && (reg_hour_count == 5'b0)) reg_hour_count <= 23;
    else  if((reg_key_minus == 1'b0) && (state_current == S_HOUR) && (reg_hour_count != 5'b0)) reg_hour_count <= reg_hour_count - 1'b1; 
  end  
end 

//_____________ key ________________________
always @(posedge clk)
begin
  if (~reg_reset_n)
     reg_cnt_15scd <= 4'b0;
  else 
  begin
  	 if(((reg_cnt_15scd == 14) && (reg_1s_flag == 1)) || 
           ((state_current != S_CLOCK) && ((reg2_plus == 1'b0 ) || reg_key_minus == 1'b0)))
    reg_cnt_15scd <= 4'b0;
    else  if((reg_1s_flag == 1'b1 ) && (state_current != S_CLOCK)) 
    reg_cnt_15scd <= reg_cnt_15scd + 1;  
  end
end

//assign keym_val = reg_cnt_xms == 20;

always @(posedge clk)
begin
  if (~reg_reset_n)
     reg_cnt_3scd <= 2'b00;
  else 
  begin
  	if(key_mode) 
      reg_cnt_3scd <= 2'b00;
    else if((reg_1s_flag == 1'b1 ) && (reg1_modify == 1'b0) && (reg_cnt_3scd != 2)) 
      reg_cnt_3scd <= reg_cnt_3scd + 1;  
  end
end

assign key_mode = (reg_cnt_3scd == 2) && (reg_1s_flag == 1) && (reg1_modify == 1'b0) && (state_current == S_CLOCK);

always @(posedge clk)
begin
  if (~reg_reset_n)
     reg_cnt_xms <= 8'b0;
  else 
  begin
  	   `ifdef SIM
        if((reg_cnt_xms == 2) &&(reg_ms_flag == 1'b1)) reg_cnt_xms <= 5'b0;
     `else
        if((reg_cnt_xms == 210) &&(reg_ms_flag == 1'b1)) reg_cnt_xms <= 8'b0;
     `endif
  	    if((reg_ms_flag == 1'b1 ) && (reg1_modify == 1'b0) && (reg_key_minus == 1'b1) && (reg_cnt_xms != 210)) 
       reg_cnt_xms <= reg_cnt_xms + 1;
     end
end
always @(posedge clk)
begin                    
  if (~reg_reset_n) 
    begin
       reg1_modify <= 1'b1;
    end
  else reg1_modify <= modify_n;
end
always @(posedge clk)
begin                    
  if (~reg_reset_n) 
    begin
      reg_key_mode <= 1'b1;
    end
    else
    begin
     if((key_mode == 1'b1) && (reg_key_mode  ==1'b1) && (reg_key_mode1 == 1'b1))
        reg_key_mode <= 1'b0;
      else if(reg_key_mode1 == 1'b0)
        reg_key_mode <= 1'b1;
     end
end
always @(posedge clk)
begin                    
  if (~reg_reset_n) 
    begin
       reg_key_mode1 <= 1'b1;
    end
  else reg_key_mode1 <= reg_key_mode;
end

always @(posedge clk)
begin                    
  if (~reg_reset_n) 
    begin
       reg_key_minus <= 1'b1;
    end
  else
    begin
       `ifdef SIM
         if((reg_cnt_xms == 2) && (reg_ms_flag == 1'b1))
       `else  
         if((reg_cnt_xms == 210) && (reg_ms_flag == 1'b1))
      `endif
         reg_key_minus <= 1'b0;
      else reg_key_minus <= 1'b1;
    end
end

always @(posedge clk)
begin
  if (~reg_reset_n)
     reg_cnt1_xms <= 8'b0;
  else 
  begin
  	   if((reg_cnt1_xms == 210) && (reg_ms_flag == 1'b1)) reg_cnt1_xms <= 8'b0;
  	   else if((reg_ms_flag == 1'b1 ) && (reg1_plus == 1'b0) && (reg2_plus == 1'b1) && (reg_cnt1_xms != 210)) 
       reg_cnt1_xms <= reg_cnt1_xms + 1;
     end
end

always @(posedge clk)
begin
  if (~reg_reset_n)
    begin
      reg1_plus <= 1'b1;
      reg2_plus <= 1'b1;   
    end
  else  
    begin
    	reg1_plus <= plus_n;
    	if((reg_cnt1_xms == 210) && (reg_ms_flag == 1'b1))
      reg2_plus <= 1'b0;
      else reg2_plus <= 1'b1;
    end
end
//_________ state machine _______________
always @(posedge clk)
begin
  if (~reg_reset_n)
     state_current <= S_CLOCK;
  else 
     state_current <= state_next;
end

always @(*)
 begin
    state_next = S_CLOCK;
         case(state_current)
               S_CLOCK : begin 
                            if(reg_key_mode == 1'b0)
                            begin  
                            	state_next = S_HOUR; 
                            end         
                            else state_next = state_next;
                          end
               S_HOUR :  begin
                            if((reg_cnt_15scd == 14) && (reg_1s_flag == 1))
                               begin
                             	   state_next = S_MINUTE;
                             	 end
                             	 else  state_next = S_HOUR; 
                          end           
               S_MINUTE : begin
                              if((reg_cnt_15scd == 14) && (reg_1s_flag == 1))              
                              begin 
                              	state_next = S_CLOCK;
                              	end 
                              	else state_next = S_MINUTE;  
                            end
               default : state_next = S_CLOCK;  
         endcase
  end

endmodule
