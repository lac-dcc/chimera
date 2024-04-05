
module speed_neg_control 
  (
    input   wire          clk,          // clock
    input   wire          reset,        // reset
    output  reg           mgt_reset,    // GTX reset request
    input   wire          linkup,       // SATA link established
    output  reg   [7:0]   daddr,        // DRP address
    output  reg           den,          // DRP enable
    output  reg   [15:0]  di,           // DRP data in
    input   wire  [15:0]  do,           // DRP data out
    input   wire          drdy,         // DRP ready
    output  reg           dwe,          // DRP write enable
    input   wire          gtx_lock,     // GTX locked
    output  wire  [5:0]   state_out,
    output  reg   [1:0]   gen_value,
    input   wire          gt0_txresetdone_i,
    input   wire          gt0_rxresetdone_i
    
  );


  parameter  [5:0]    IDLE            = 6'h00;
  parameter  [5:0]    READ_GEN3       = 6'h01;
  parameter  [5:0]    WRITE_GEN3      = 6'h02;
  parameter  [5:0]    COMPLETE_GEN3   = 6'h03;
  parameter  [5:0]    PAUSE_GEN3      = 6'h04;
  parameter  [5:0]    READ1_GEN3      = 6'h05;
  parameter  [5:0]    WRITE1_GEN3     = 6'h06;
  parameter  [5:0]    COMPLETE1_GEN3  = 6'h07;
  parameter  [5:0]    PAUSE1_GEN3     = 6'h08;
  parameter  [5:0]    READ2_GEN3      = 6'h09;
  parameter  [5:0]    WRITE2_GEN3     = 6'h0A;
  parameter  [5:0]    COMPLETE2_GEN3  = 6'h0B;
  parameter  [5:0]    PAUSE2_GEN3     = 6'h0C;
  parameter  [5:0]    READ3_GEN3      = 6'h0D;
  parameter  [5:0]    WRITE3_GEN3     = 6'h0E;
  parameter  [5:0]    COMPLETE3_GEN3  = 6'h0F;
  parameter  [5:0]    RESET_GEN3      = 6'h10;
  parameter  [5:0]    WAIT_GEN3       = 6'h11;  
  parameter  [5:0]    READ_GEN2       = 6'h12;
  parameter  [5:0]    WRITE_GEN2      = 6'h13;
  parameter  [5:0]    COMPLETE_GEN2   = 6'h14;
  parameter  [5:0]    PAUSE_GEN2      = 6'h15;
  parameter  [5:0]    READ1_GEN2      = 6'h16;
  parameter  [5:0]    WRITE1_GEN2     = 6'h17;
  parameter  [5:0]    COMPLETE1_GEN2  = 6'h18;
  parameter  [5:0]    PAUSE1_GEN2     = 6'h19; 
  parameter  [5:0]    READ2_GEN2      = 6'h1A; 
  parameter  [5:0]    WRITE2_GEN2     = 6'h1B; 
  parameter  [5:0]    COMPLETE2_GEN2  = 6'h1C; 
  parameter  [5:0]    PAUSE2_GEN2     = 6'h1D; 
  parameter  [5:0]    READ3_GEN2      = 6'h1E; 
  parameter  [5:0]    WRITE3_GEN2     = 6'h1F; 
  parameter  [5:0]    COMPLETE3_GEN2  = 6'h20; 
  parameter  [5:0]    RESET_GEN2      = 6'h21; 
  parameter  [5:0]    WAIT_GEN2       = 6'h22; 
  parameter  [5:0]    READ_GEN1       = 6'h23; 
  parameter  [5:0]    WRITE_GEN1      = 6'h24; 
  parameter  [5:0]    COMPLETE_GEN1   = 6'h25; 
  parameter  [5:0]    PAUSE_GEN1      = 6'h26; 
  parameter  [5:0]    READ1_GEN1      = 6'h27; 
  parameter  [5:0]    WRITE1_GEN1     = 6'h28; 
  parameter  [5:0]    COMPLETE1_GEN1  = 6'h29; 
  parameter  [5:0]    PAUSE2_GEN1     = 6'h2A; 
  parameter  [5:0]    READ3_GEN1      = 6'h2B; 
  parameter  [5:0]    WRITE3_GEN1     = 6'h2C; 
  parameter  [5:0]    COMPLETE3_GEN1  = 6'h2D; 
  parameter  [5:0]    RESET_GEN1      = 6'h2E; 
  parameter  [5:0]    WAIT_GEN1       = 6'h2F;
  parameter  [5:0]    LINKUP          = 6'h30; 


  reg [5:0]      state;
  reg [31:0]     linkup_cnt;
  reg [15:0]     drp_reg;
  reg [15:0]     reset_cnt;
  reg [3:0]      pause_cnt;

  assign  state_out = state;

always @ (posedge clk or posedge reset) begin
  if(reset) begin
    state      <= IDLE;
    daddr      <= 8'b0;
    di         <= 16'b0;
    den        <= 1'b0;
    dwe        <= 1'b0;
    drp_reg    <= 16'b0;
    linkup_cnt <= 32'h0;
    gen_value  <= 2'b10;
    reset_cnt  <= 16'b0000000000000000;
    mgt_reset  <= 1'b0;
    pause_cnt  <= 4'b0000;
  end
  else begin
    case(state)
//states for setting attribute RXOUT_DIV       
      IDLE:  begin
        if(gtx_lock && gt0_txresetdone_i && gt0_rxresetdone_i) begin
          daddr     <= 8'h88;
          den       <= 1'b1;
          gen_value <= 2'b10; //GEN3
          state     <= READ_GEN3;
        end
        else begin
          state <= IDLE;
        end
      end
      READ_GEN3: begin
        if(drdy) begin
          drp_reg <= do;
          den     <= 1'b0;
          state   <= WRITE_GEN3;
        end
        else begin
          state   <= READ_GEN3;
        end
      end
      WRITE_GEN3: begin
        di    <= {drp_reg[15:3], 3'b0};  //this actually takes care of all the bits that I should have to change.
        den   <= 1'b1;
        dwe   <= 1'b1;
        state <= COMPLETE_GEN3;
      end
      COMPLETE_GEN3: begin
        if(drdy) begin
          dwe   <= 1'b0;
          den   <= 1'b0;
          state <= PAUSE_GEN3;
        end
        else begin
          state <= COMPLETE_GEN3;
        end
      end
// states for setting attribute TXOUT_DIV       
      PAUSE_GEN3: begin
        if(pause_cnt == 4'b1111) begin
          dwe   <= 1'b0;
          den   <= 1'b1;
          daddr <= 8'h88;
          pause_cnt <= 4'b0000;
          state <= READ1_GEN3;
        end
        else begin
          pause_cnt <= pause_cnt + 1'b1;
          state <= PAUSE_GEN3;
        end
      end           
      READ1_GEN3: begin
        if(drdy) begin
          drp_reg <= do;
          den     <= 1'b0;
          state   <= WRITE1_GEN3;
        end        
        else begin
          state   <= READ1_GEN3;
        end
      end
      WRITE1_GEN3: begin
        di    <= {drp_reg[15:5],3'b0,drp_reg[3:0]};
        den   <= 1'b1;
        dwe   <= 1'b1;
        state <= COMPLETE1_GEN3;
      end
      COMPLETE1_GEN3: begin
        if(drdy) begin
          dwe   <= 1'b0;
          den   <= 1'b0;
          state <= PAUSE1_GEN3; //RESET_GEN3
        end
        else begin
          state <= COMPLETE1_GEN3;
        end
      end    
//states for setting attribute RXCDR_CFG       
      PAUSE1_GEN3: begin
        if(pause_cnt == 4'b1111) begin
          dwe       <= 1'b1;
          den       <= 1'b1;
          daddr     <= 8'hA8;
          di[15:0]  <= 16'h 0010;
          pause_cnt <= 4'b0000;
          state     <= COMPLETE2_GEN3;
        end
        else begin
          pause_cnt <= pause_cnt + 1'b1;
          state <= PAUSE1_GEN3;
        end
      end 
//       READ2_GEN3: begin
//         if(drdy) begin
//           drp_reg <= do;
//           den     <= 1'b0;
//           state   <= WRITE2_GEN3;
//         end        
//         else begin
//           state   <= READ2_GEN3;
//         end
//       end
//       WRITE2_GEN3: begin
//         di       <= drp_reg;  
//         di[15:0]  <= 16'h 0010;
//         den      <= 1'b1;
//         dwe      <= 1'b1;
//         state    <= COMPLETE2_GEN3;
//       end
      COMPLETE2_GEN3: begin
        if(drdy) begin
          dwe   <= 1'b0;
          den   <= 1'b0;
          state <= PAUSE2_GEN3;                  
        end
        else begin
          state <= COMPLETE2_GEN3;
        end
      end
      PAUSE2_GEN3: begin
        if(pause_cnt == 4'b1111) begin
          dwe       <= 1'b1;
          den       <= 1'b1;
          daddr     <= 8'hA9;
          di[15:0]  <= 16'h 2020;
          pause_cnt <= 4'b0000;
          state     <= COMPLETE3_GEN3;
        end
        else begin
          pause_cnt <= pause_cnt + 1'b1;
          state <= PAUSE2_GEN3;
        end
      end       
//       READ3_GEN3: begin
//         if(drdy) begin
//           drp_reg <= do;
//           den     <= 1'b0;
//           state   <= WRITE3_GEN3;
//         end        
//         else begin
//           state   <= READ3_GEN3;
//         end
//       end
//       WRITE3_GEN3: begin
//         di[3:0]  <= drp_reg[3:0];  
//         di[15:4] <= 12'h 202;
//         den      <= 1'b1;
//         dwe      <= 1'b1;
//         state    <= COMPLETE3_GEN3;
//       end
      COMPLETE3_GEN3: begin
        if(drdy) begin
          dwe   <= 1'b0;
          den   <= 1'b0;
          state <= RESET_GEN3;
        end
        else begin
          state <= COMPLETE3_GEN3;
        end
      end      
      RESET_GEN3: begin
        if(reset_cnt == 16'b00001111) begin
          reset_cnt <= reset_cnt + 1'b1;
          state <= RESET_GEN3;
          mgt_reset <= 1'b1;
        end
        else if(reset_cnt == 16'b0000000000011111) begin
          reset_cnt <= 16'b00000000;
          mgt_reset <= 1'b0;
          state <= WAIT_GEN3;
        end
        else begin
          reset_cnt <= reset_cnt + 1'b1;
          state <= RESET_GEN3;
        end
      end
      WAIT_GEN3:  begin 
        if(linkup) begin
          linkup_cnt <= 32'h0;
          state <= LINKUP;
        end
        else begin
          if(gtx_lock)
          begin
          `ifdef SIM 
            if(linkup_cnt == 32'h000007FF) //for simulation only
          `else 
            if(linkup_cnt == 32'h00080EB4) // Duration allows four linkup tries
          `endif 
            begin
              linkup_cnt <= 32'h0;
              daddr      <= 8'h88;
              den        <= 1'b1;
              gen_value  <= 2'b01; //this is Gen2
              state      <= READ_GEN2;
              //state <= WAIT_GEN2;  //MD don't switch back and forth to see if this improves the linkup situation
            end
            else begin
              linkup_cnt <= linkup_cnt + 1'b1;
              state <= WAIT_GEN3;
            end
          end
          else begin
            state <= WAIT_GEN3;
          end
        end
      end
      READ_GEN2: begin
        if(drdy) begin
          drp_reg <= do;
          den   <= 1'b0;
          state <= WRITE_GEN2;
        end 
        else begin
          state <= READ_GEN2;
        end
      end
      WRITE_GEN2: begin
        di    <= {drp_reg[15:3], 3'b1};  //this actually takes care of all the bits that I should have to change.//appears the comm doesn't change. changed bit 9 to never switch.
        den   <= 1'b1;
        dwe   <= 1'b1;
        state <= COMPLETE_GEN2;
      end
      COMPLETE_GEN2: begin
        if(drdy) begin
          dwe   <= 1'b0;
          den   <= 1'b0;
          state <= PAUSE_GEN2;
        end
        else begin
          state <= COMPLETE_GEN2;
        end
      end
      PAUSE_GEN2: begin
        if(pause_cnt == 4'b1111) begin
          dwe   <= 1'b0;
          den   <= 1'b1;
          daddr <= 8'h88;
          pause_cnt <= 4'b0000;
          state <= READ1_GEN2;
        end
        else begin
          pause_cnt <= pause_cnt + 1'b1;
          state <= PAUSE_GEN2;
        end
      end 
      READ1_GEN2: begin
        if(drdy)  begin
          drp_reg <= do;
          den     <= 1'b0;
          state   <= WRITE1_GEN2;
        end
        else  begin
          state <= READ1_GEN2;
        end
      end
      WRITE1_GEN2: begin
        di    <= {drp_reg[15:7],3'b1,drp_reg[3:0]};  //
        den   <= 1'b1;
        dwe   <= 1'b1;
        state <= COMPLETE1_GEN2;
      end
      COMPLETE1_GEN2: begin
        if(drdy) begin
          dwe   <= 1'b0;
          den   <= 1'b0;
          state <= PAUSE1_GEN2;  //RESET_GEN2;         
        end
        else begin
          state <= COMPLETE1_GEN2;
        end
      end  
      // states for setting attribute RXCDR_CFG       
      PAUSE1_GEN2: begin
        if(pause_cnt == 4'b1111) begin
          dwe   <= 1'b1;
          den   <= 1'b1;
          daddr <= 8'hA8;
          di    <= 16'h0008;
          pause_cnt <= 4'b0000;
          state <= COMPLETE2_GEN2;
        end
        else begin
          pause_cnt <= pause_cnt + 1'b1;
          state <= PAUSE1_GEN2;
        end
      end 
//       READ2_GEN2: begin
//         if(drdy) begin
//           drp_reg <= do;
//           den     <= 1'b0;
//           state   <= WRITE2_GEN2;
//         end        
//         else begin
//           state   <= READ2_GEN2;
//         end
//       end
//       WRITE2_GEN2: begin
//         di       <= drp_reg;  
//         di[4:0]  <= 5'h 8;
//         den      <= 1'b1;
//         dwe      <= 1'b1;
//         state    <= COMPLETE2_GEN2;
//       end
      COMPLETE2_GEN2: begin
        if(drdy) begin
          dwe   <= 1'b0;
          den   <= 1'b0;
          state <= PAUSE2_GEN2;                  
        end
        else begin
          state <= COMPLETE2_GEN2;
        end
      end
      PAUSE2_GEN2: begin
        if(pause_cnt == 4'b1111) begin
          dwe   <= 1'b1;
          den   <= 1'b1;
          daddr <= 8'hA9;
          di    <= 16'h 4020;
          pause_cnt <= 4'b0000;
          state <= COMPLETE3_GEN2;
        end
        else begin
          pause_cnt <= pause_cnt + 1'b1;
          state <= PAUSE2_GEN2;
        end
      end       
//       READ3_GEN2: begin
//         if(drdy) begin
//           drp_reg <= do;
//           den     <= 1'b0;
//           state   <= WRITE3_GEN2;
//         end        
//         else begin
//           state   <= READ3_GEN2;
//         end
//       end
//       WRITE3_GEN2: begin
//         di       <= drp_reg;  
//         di[15:4] <= 12'h 402;
//         den      <= 1'b1;
//         dwe      <= 1'b1;
//         state    <= COMPLETE3_GEN2;
//       end
      COMPLETE3_GEN2: begin
        if(drdy) begin
          dwe   <= 1'b0;
          den   <= 1'b0;
          state <= RESET_GEN2;
        end
        else begin
          state <= COMPLETE3_GEN2;
        end
      end     
      RESET_GEN2: begin
        if(reset_cnt == 16'b00001111) begin
          reset_cnt <= reset_cnt + 1'b1;
          state <= RESET_GEN2;
          mgt_reset <= 1'b1;
        end
        else if(reset_cnt == 16'h001F) begin
          reset_cnt <= 16'b00000000;
          mgt_reset <= 1'b0;
          state <= WAIT_GEN2;
        end
        else begin
          reset_cnt <= reset_cnt + 1'b1;
          state <= RESET_GEN2;
        end
      end
      WAIT_GEN2:  begin
        if(linkup) begin
          linkup_cnt <= 32'h0;
          state <= LINKUP;
        end
        else begin
          if(gtx_lock)
          begin
            `ifdef SIM 
            if(linkup_cnt == 32'h000007FF) //for simulation only
            `else					  
            if(linkup_cnt == 32'h00080EB4) //// Duration allows four linkup tries
            `endif 
            begin
              linkup_cnt <= 32'h0;
              daddr <= 8'h88;
              den   <= 1'b1;
              gen_value <= 2'b 00; //this is Gen1
              state <= READ_GEN1;   
            end
            else  begin
              linkup_cnt <= linkup_cnt + 1'b1;
              state <= WAIT_GEN2;
            end
          end
          else begin
            state <= WAIT_GEN2;
          end
        end 
      end    
      READ_GEN1: begin
        if(drdy)
        begin
          drp_reg <= do;
          den   <= 1'b0;
          state <= WRITE_GEN1;
        end
        else
        begin
          state <= READ_GEN1;
        end
      end
      WRITE_GEN1: begin
        di    <= {drp_reg[15:3],3'h 2};  //this actually takes care of all the bits that I should have to change.//appears the comm doesn't change. changed bit 9 to never switch.
        den   <= 1'b1;
        dwe   <= 1'b1;
        state <= COMPLETE_GEN1;
      end
      COMPLETE_GEN1: begin
        if(drdy)
        begin
          dwe   <= 1'b0;
          den   <= 1'b0;
          state <= PAUSE_GEN1;
        end
        else
        begin
          state <= COMPLETE_GEN1;
        end
      end
      PAUSE_GEN1: begin
        if(pause_cnt == 4'b1111)
        begin
          dwe   <= 1'b0;
          den   <= 1'b1;
          daddr <= 8'h88;
          pause_cnt <= 4'b0000;
          state <= READ1_GEN1;
        end
        else
        begin
          pause_cnt <= pause_cnt + 1'b1;
          state <= PAUSE_GEN1;
        end
      end 
      READ1_GEN1: begin
        if(drdy)
        begin
          drp_reg <= do;
          den   <= 1'b0;
          state <= WRITE1_GEN1;
        end
        else
        begin
          state <= READ1_GEN1;
        end
      end
      WRITE1_GEN1: begin
        di      <= {drp_reg[15:5],3'h 2,drp_reg[3:0]};  //
        den     <= 1'b1;
        dwe     <= 1'b1;
        state   <= COMPLETE1_GEN1;
      end
      COMPLETE1_GEN1: begin
        if(drdy)
        begin
          dwe   <= 1'b0;
          den   <= 1'b0;
          state <= PAUSE2_GEN1;//RESET_GEN1;
        end
        else
        begin
          state <= COMPLETE1_GEN1;
        end
      end
// states for setting attribute RXCDR_CFG   
    
//    PAUSE1_GEN1: begin
//        if(pause_cnt == 4'b1111) begin
//          dwe   <= 1'b0;
//          den   <= 1'b1;
//          daddr <= 8'hA8;
//          pause_cnt <= 4'b0000;
//          state <= READ2_GEN1;
//        end
//        else begin
//          pause_cnt <= pause_cnt + 1'b1;
//          state <= PAUSE1_GEN1;
//        end
//      end 
//      READ2_GEN1: begin
//        if(drdy) begin
//          drp_reg <= do;
//          den     <= 1'b0;
//          state   <= WRITE2_GEN1;
//        end        
//        else begin
//          state   <= READ2_GEN1;
//        end
//      end
//      WRITE2_GEN1: begin
//        di       <= drp_reg;  
//        di[4:0]  <= 5'h 8;
//        den      <= 1'b1;
//        dwe      <= 1'b1;
//        state    <= COMPLETE2_GEN1;
//      end
//      COMPLETE2_GEN1: begin
//        if(drdy) begin
//          dwe   <= 1'b0;
//          den   <= 1'b0;
//          state <= PAUSE2_GEN1;
//        end
//        else begin
//          state <= COMPLETE2_GEN1;
//        end
//      end  

      PAUSE2_GEN1: begin
        if(pause_cnt == 4'b1111) begin
          dwe       <= 1'b1;
          den       <= 1'b1;
          daddr     <= 8'hA9;
          di        <= 16'h 4010;
          pause_cnt <= 4'b0000;
          state     <= COMPLETE3_GEN1;
        end
        else begin
          pause_cnt <= pause_cnt + 1'b1;
          state     <= PAUSE2_GEN1;
        end
      end       
//       READ3_GEN1: begin
//         if(drdy) begin
//           drp_reg <= do;
//           den     <= 1'b0;
//           state   <= WRITE3_GEN1;
//         end        
//         else begin
//           state   <= READ3_GEN1;
//         end
//       end
//       WRITE3_GEN1: begin
//         di       <= drp_reg;  
//         di[15:4] <= 12'h 401;
//         den      <= 1'b1;
//         dwe      <= 1'b1;
//         state    <= COMPLETE3_GEN1;
//       end
      COMPLETE3_GEN1: begin
        if(drdy) begin
          dwe   <= 1'b0;
          den   <= 1'b0;
          state <= RESET_GEN1;               
        end
        else begin
          state <= COMPLETE3_GEN1;
        end
      end      
      RESET_GEN1: begin
        if(reset_cnt == 16'b00001111)
        begin
          reset_cnt <= reset_cnt + 1'b1;
          state     <= RESET_GEN1;
          mgt_reset <= 1'b1;
        end
        else if(reset_cnt == 16'h001F)
        begin
          reset_cnt <= 16'b00000000;
          mgt_reset <= 1'b0;
          state     <= WAIT_GEN1;
        end
        else
        begin
          reset_cnt <= reset_cnt + 1'b1;
          state     <= RESET_GEN1;
        end
      end
      WAIT_GEN1:  begin
        if(linkup) begin
          linkup_cnt <= 32'h0;
          state      <= LINKUP;
        end
        else begin
          if(gtx_lock) begin
            `ifdef SIM 
            if(linkup_cnt == 32'h000007FF) //for simulation only
            `else
            if(linkup_cnt == 32'h00080EB4) //// Duration allows four linkup tries
            `endif 
            begin
              linkup_cnt <= 32'h0;
              daddr      <= 8'h88;
              den        <= 1'b1;
              gen_value  <= 2'b10; //GEN3
              state      <= READ_GEN3; // after elapsed time the linkup resumes to Gen3
            end
            else begin
              linkup_cnt <= linkup_cnt + 1'b1;
              state      <= WAIT_GEN1;
            end
          end
          else begin
            state <= WAIT_GEN1;
          end
        end
      end
      LINKUP: begin
        if (linkup)
          state <= LINKUP;
        else begin
          linkup_cnt <= 32'h0;
          daddr      <= 8'h88;
          den        <= 1'b1;
          gen_value  <= 2'b10; //GEN3
          state      <= READ_GEN3; // after elapsed time the linkup resumes to Gen3
        end
      end 
      default: begin
        state     <= IDLE;
        daddr     <= 7'b0;
        di        <= 8'b0;
        den       <= 1'b0;
        dwe       <= 1'b0;
        drp_reg   <= 16'b0;
        linkup_cnt <= 32'h0;
        gen_value <= 2'b10;
        reset_cnt <= 8'b00000000;
        mgt_reset <= 1'b0;
        pause_cnt <= 4'b0000;
      end 
    endcase
  end 
end

endmodule
