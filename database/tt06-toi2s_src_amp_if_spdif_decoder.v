// This program was cloned from: https://github.com/jorgenkraghjakobsen/tt06-toi2s
// License: Apache License 2.0

  module spdif_decoder ( 
    input clk_in,   //! dsfsdf
    input resetb,
    input rx_in,
    output i2s_bck,
    output i2s_ws,
    output i2s_d0,
    output audio_locked,
    output edgedetect
  );
    wire clk;
    assign clk = clk_in;
    
    assign edgedetect = rxup; //rxedge; //edgedetect i2s_bck; // bitedge_detected & (bitlength > 12) & (bitlength <= 16);
  
    
    assign audio_locked = 1'b1; 
    
    reg [3:0] correlator;
  
    always @(posedge clk)
    begin
      if (!resetb)
        correlator <= 4'b0000;
      else
        correlator <= {correlator[2:0], rx_in};
    end
    wire rxup,rxdown,rxedge;
  
    assign rxup   = rxedge & correlator[1];           // 100
    assign rxdown = rxedge & !correlator[1];          // 011 xxx not sign
  
    assign rxedge = (correlator[2] ^ correlator[1]);  // 100 or 011
  
    // Measure length between edge and store length and bitvalue
    // Generate bitclk for i2s_interface
    // Phase correct logic
  
    reg [7:0] bitcnt;
    reg [7:0] bckcnt;
  
    reg [7:0] bitlength;
    reg bitvalue;
    reg bitedge_detected;
    reg i2s_bck_reg;
    reg i2s_bck_next;
    reg phase_reg;
    reg ws_old_reg;
    reg i2s_ws_reg;
    localparam  bckclks=4; //17;
    
    always @(posedge clk)
    begin
      if (resetb == 0)
      begin
        ws_old_reg  <= 1'b0;
        phase_reg   <= 1'b0;
        i2s_bck_reg <= 1'b0;
        //i2s_bck_next  <= 1'b0; 
        bckcnt      <= 8'h00;
        bitcnt      <= 8'h00;
        bitlength   <= 8'h00;
        bitvalue    <= 1'b0;
        bitedge_detected  <= 1'b0;
      end
      else
      begin
        if (rxedge == 1)
        begin
          bitvalue         <= correlator[1];
          bitlength        <= bitcnt;
          bitcnt           <= 8'h00;
          bitedge_detected <= 1'b1;
          if (rxup == 1)
          begin
            ws_old_reg       <= i2s_ws_reg;
            bckcnt           <= 8'h00;
            if (((bckcnt > 9+1) & (bckcnt < 14+1) & (bckcnt!=bitcnt)) |
                ((bckcnt > 19+1) & (bckcnt < 25+1)))
              phase_reg <= !phase_reg;
            /*if (ws_old_reg == 1'b1 & i2s_ws_reg == 1'b0)
            begin 
              if (bckcnt > bckclks + 8)
                phase_reg <= !phase_reg;      
            end*/
          end
        end
        else
        begin
          bitvalue  <= bitvalue;
          bitlength <= bitlength;
          bitedge_detected <= 1'b0;
          bitcnt    <= bitcnt + 8'h01;
          bckcnt    <= bckcnt + 8'h01;
          i2s_bck_reg <= i2s_bck_next;
  
        end
      end
    end
    
    //assign edgedetect = rxedge; //edgedetect i2s_bck; // bitedge_detected & (bitlength > 12) & (bitlength <= 16);
  
    
    //assign i2s_bck_next = (bitcnt <= 8) or (bitcnt )
    always @*
    begin
      //i2s_bck_next = i2s_bck_reg;
  
      if (bckcnt <= bckclks)
        i2s_bck_next = !phase_reg;
      else if (bckcnt <= bckclks*2)
        i2s_bck_next = phase_reg;
      else if (bckcnt <= bckclks*3)
        i2s_bck_next = !phase_reg;
      else if (bckcnt <= bckclks*4)
        i2s_bck_next = phase_reg;
      else if (bckcnt <= bckclks*5)
        i2s_bck_next = !phase_reg;
      else if (bckcnt <= bckclks*6)
        i2s_bck_next = phase_reg;
      else if (bckcnt <= bckclks*7)
        i2s_bck_next = !phase_reg;
      else 
        i2s_bck_next = i2s_bck_reg;  
    end
    
    assign i2s_bck = !i2s_bck_reg;
    // Bucket list - Update a table of stats on bit lengths
    /*
    reg [7:0] bucket_mem [31:0];
    integer j; 
    always @(posedge clk, negedge resetb)
    begin
      if (~resetb) 
      begin 
        for (j=0; j < 32; j=j+1) begin
          bucket_mem[j] <= 8'h00; 
        end
      end
      else
      begin 
        if (bitedge_detected) 
        begin
          bucket_mem[bitlength[4:0]] <= bucket_mem[bitlength[4:0]] + 1;    
        end
      end     
    end
    */
  
    // Code extractor
    // 010      | 101      =>  1
    // 001      | 110      =>  0
    // 00010111 | 11101000 => Sync B Left and new frame
    // 00011011 | 11100100 => Sync W Right
    // 00011101 | 11100010 => Sync M Left
  
    localparam [3:0]  // States
               INIT_ST            = 4'b0000,
               SEARCH_ST          = 4'b0001,
               FOUND_1_0_ST       = 4'b0010,
               FOUND_1_1_ST       = 4'b0011,
               FOUND_0_ST         = 4'b0100,
               FOUND_SYNC_0_ST    = 4'b0101,
               FOUND_SYNC_B_ST    = 4'b0110,
               FOUND_SYNC_B1_ST   = 4'b0111,
               FOUND_SYNC_B2_ST   = 4'b1000,
               FOUND_SYNC_W_ST    = 4'b1001,
               FOUND_SYNC_W1_ST   = 4'b1010,
               FOUND_SYNC_W2_ST   = 4'b1011,
               FOUND_SYNC_M_ST    = 4'b1100,
               FOUND_SYNC_M1_ST   = 4'b1101,
               FOUND_SYNC_M2_ST   = 4'b1111;
  
    reg  state_det;
    reg  next_det ;
    // assign edgedetect = state_det;// bitedge_detected & (bitlength > 16) & (bitlength <= 44);
  
    reg [23:0] pcmbufL , pcmbufL_next;
    reg [23:0] pcmbufR , pcmbufR_next;
  
    reg [4:0]  pcm_index, pcm_index_next ;
    reg [3:0] ext_state = 4'b0000;
    reg [3:0] ext_next = 4'b0000;
    reg i2s_ws_next;
    reg i2s_d0_reg, i2s_d0_next;
  
    assign i2s_ws    = i2s_ws_reg;
    
    assign i2s_d0    = i2s_d0_reg;
  
    always @(posedge clk)
    begin
      if (!resetb)
      begin
        ext_state <= INIT_ST;
        pcm_index <= 5'h00;
        state_det <= 1'b0;
        i2s_ws_reg <= 1'b0;
        i2s_d0_reg <= 1'b0;
      end
      else
      begin
        ext_state <= ext_next;
        state_det <= next_det;
        pcm_index <= pcm_index_next;
        i2s_ws_reg <= i2s_ws_next;
        i2s_d0_reg <= i2s_d0_next;
        pcmbufL <= pcmbufL_next;
        pcmbufR <= pcmbufR_next;
      end
    end
  
    localparam [7:0] T3 = 12; //42; //32; //42;
    localparam [7:0] T2 = 10; //38; //30; //38;
    localparam [7:0] T1 = 4; //20;  //16; //20;
  
    always @*
    begin
      ext_next = ext_state;
      pcm_index_next = pcm_index;
      pcmbufL_next = pcmbufL;
      pcmbufR_next = pcmbufR;
  
      next_det = 1'b0;
      i2s_ws_next = i2s_ws_reg;
      i2s_d0_next = i2s_d0_reg;
      case(ext_state)
        INIT_ST :     // Set up and enter search
        begin
          i2s_ws_next  = 1'b0;
          i2s_d0_next  = 1'b0;
          ext_next = SEARCH_ST;
        end
        SEARCH_ST :   // Look for first syncword
        begin
          i2s_ws_next   = 1'b0;
          //i2s_d0_next   = 1'b0;
          if (bitedge_detected & (bitlength > T3))
          begin
            ext_next =  FOUND_SYNC_0_ST;
          end
        end
        FOUND_SYNC_0_ST :
        begin
          //next_det = 1'b1;
  
          if (bitedge_detected)
          begin
            if (bitlength <= T1)
              ext_next = FOUND_SYNC_B_ST;     // New frame + Left  ws=0
            else if  (bitlength <= T2 )
              ext_next = FOUND_SYNC_W_ST;     // Right             ws=1
            else if  (bitlength > T3)
              ext_next = FOUND_SYNC_M_ST;     // Left              ws=0
            else
              ext_next = SEARCH_ST;
          end
        end
        FOUND_SYNC_B_ST : // 00010111 | 11101000 => Sync B Left and new frame (ws=0)
        begin
          //next_det    = 1'b1;
          if (bitedge_detected & (bitlength <= T1) )
            ext_next = FOUND_SYNC_B1_ST;
        end
        FOUND_SYNC_B1_ST :
        begin
          if (bitedge_detected & (bitlength >= T3) )
            ext_next = FOUND_SYNC_B2_ST;
        end
        FOUND_SYNC_B2_ST :
        begin
          //next_det    = 1'b1;
          i2s_ws_next = 1'b0;
          pcm_index_next = 0;
          if (bitedge_detected)
          begin
            if (bitlength <= T1)
              ext_next = FOUND_1_0_ST;
            else if (bitlength > (T1) )
              ext_next = FOUND_0_ST;
            else
              ext_next = SEARCH_ST;
          end
        end
        FOUND_SYNC_W_ST :                   // 00011011 | 11100100 => Sync W Right ws=1
        begin
          //next_det    = 1'b1;
          if (bitedge_detected & (bitlength <= T1) )
            ext_next = FOUND_SYNC_W1_ST;
        end
        FOUND_SYNC_W1_ST :
        begin
          //next_det    = 1'b1;
          if (bitedge_detected & (bitlength > T1) & (bitlength < T3))
            ext_next = FOUND_SYNC_W2_ST;
        end
        FOUND_SYNC_W2_ST :
        begin
          //next_det    = 1'b1;
          i2s_ws_next = 1'b1;
          pcm_index_next = 0;
          if (bitedge_detected)
          begin
            if (bitlength <= T1)
              ext_next = FOUND_1_0_ST;
            else if (bitlength > T1 )
              ext_next = FOUND_0_ST;
            else
              ext_next = SEARCH_ST;
          end
        end
        FOUND_SYNC_M_ST :                  // 00011101 | 11100010 => Sync M Left  ws=0
        begin
          if (bitedge_detected & (bitlength <= T1) )
            ext_next = FOUND_SYNC_M1_ST;
        end
        FOUND_SYNC_M1_ST :
        begin
          if (bitedge_detected & (bitlength <= T1) )
            ext_next = FOUND_SYNC_M2_ST;
        end
        FOUND_SYNC_M2_ST :
        begin
          next_det    = 1'b1;
          i2s_ws_next = 1'b0;
          pcm_index_next = 0;
          if (bitedge_detected)
          begin
            if (bitlength <= T1)
              ext_next = FOUND_1_0_ST;
            else if (bitlength > T1 )
              ext_next = FOUND_0_ST;
            else
              ext_next = SEARCH_ST;
          end
        end
        FOUND_1_0_ST :
        begin
          //i2s_d0_next = 1'b1;
          if (bitedge_detected & (bitlength <=T1))
            ext_next = FOUND_1_1_ST;
        end
        FOUND_1_1_ST :
        begin
          if (pcm_index < 24)
            if (i2s_ws_reg==0)
              i2s_d0_next  = pcmbufR[pcm_index];
            else
              i2s_d0_next  = pcmbufL[pcm_index];
          //i2s_d0_next = 1'b1;
          if (bitedge_detected)
          begin
            if (pcm_index < 24)
            begin
              if (i2s_ws_reg==0)
              begin
                pcmbufL_next = {pcmbufL[22:0],1'b1};
                //i2s_d0_next  = pcmbufR[pcm_index];
              end
              else
              begin
                pcmbufR_next = {pcmbufR[22:0],1'b1};
                //i2s_d0_next  = pcmbufL[pcm_index];
              end
            end
            pcm_index_next = pcm_index + 1;
            if (bitlength <= T1)
              ext_next = FOUND_1_0_ST;
            else if ((bitlength > T1) & (bitlength < T3))
              ext_next = FOUND_0_ST;
            else if (bitlength > T3 )
              ext_next = FOUND_SYNC_0_ST;
          end
        end
        FOUND_0_ST :
        begin
          if (pcm_index < 24)
            if (i2s_ws_reg==0)
              i2s_d0_next  = pcmbufR[pcm_index];
            else
              i2s_d0_next  = pcmbufL[pcm_index];
          //next_det    = 1'b1;
          //i2s_d0_next = 1'b0;
          if (bitedge_detected)
          begin
            if (pcm_index < 24)
            begin
              if (i2s_ws_reg==0)
              begin
                pcmbufL_next = {pcmbufL[22:0],1'b0};
                //i2s_d0_next  = pcmbufR[pcm_index];
              end
              else
              begin
                pcmbufR_next = {pcmbufR[22:0],1'b0};
                //i2s_d0_next  = pcmbufL[pcm_index];
              end
            end
            pcm_index_next = pcm_index + 1;
            if (bitlength <= T1)
              ext_next = FOUND_1_0_ST;
            else if ((bitlength > T1) & (bitlength < T3))
              ext_next = FOUND_0_ST;
            else if (bitlength > T3 )
              ext_next = FOUND_SYNC_0_ST;
          end
        end
        default :
          ext_next =  INIT_ST;
      endcase
    end
  endmodule
