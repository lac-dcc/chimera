`timescale 1ns / 1ps

module HTIF_offchip
(
  input          clk,
  input          rst,
  input          clk_offchip,

  input          eth_in_val,
  input   [63:0] eth_in_bits,
  output         eth_in_rdy,

  input          eth_out_rdy,
  output         eth_out_val,
  output  [63:0] eth_out_bits,
  
  output         htif_in_val,
  output  [3:0]  htif_in_bits, 

  input          htif_in_rdy,
  
  output         htif_out_rdy,
  input          htif_out_val,
  input   [3:0]  htif_out_bits,
  output         error_eth,
  output         error_htif
);

  parameter MAX_PACKET_WORDS = 5; //3; //4;
  parameter MAX_WORDS_BITNUM = 3;
  
  parameter MAX_PACKET_BYTES = 42; //13; //21; this is for 128 bits
  parameter MAX_BYTES_BITNUM = 6; //4; //5;
  
  parameter [2:0]   
    state_eth_read = 3'b001,
    state_take_htif = 3'b010,
    state_eth_write = 3'b011,
    state_eth_error = 3'b100;

  parameter [2:0]
    state_htif_idle = 3'b001,
    state_take_eth = 3'b010,
    state_htif_send = 3'b011,
    state_htif_receive = 3'b100,
    state_put_htif = 3'b101,
    state_htif_error = 3'b110;     
        
  parameter [3:0]
    cmd_read_mem = 4'b0000,
    cmd_write_mem = 4'b0001,
    cmd_read_cr = 4'b0010,
    cmd_write_cr = 4'b0011,
    cmd_start = 4'b0100,
    cmd_stop = 4'b0101,
    cmd_ack = 4'b0110,
    cmd_nack = 4'b0111;
     
      
  parameter MAX_PACKET_IN_START = 10; 
  parameter MAX_PACKET_OUT_START = 2;
  parameter MAX_PACKET_IN_STOP = 2;
  parameter MAX_PACKET_OUT_STOP = 2;
  parameter MAX_PACKET_IN_RDMEM = 10; 
  parameter MAX_PACKET_OUT_RDMEM = 34;
  parameter MAX_PACKET_IN_WRMEM = 42; 
  parameter MAX_PACKET_OUT_WRMEM = 2;
  parameter MAX_PACKET_IN_RDCR = 10;
  parameter MAX_PACKET_OUT_RDCR = 10;
  parameter MAX_PACKET_IN_WRCR = 18;
  parameter MAX_PACKET_OUT_WRCR = 2;
  parameter MAX_PACKET_IN_CMD = 2; 

  parameter HTIF_DATA_WIDTH = 4;

  integer i,j;
  reg [2:0] eth_state, next_eth_state;
  reg [2:0] htif_state, next_htif_state;
  reg [MAX_BYTES_BITNUM-1:0] bytes, next_bytes;
  reg [MAX_WORDS_BITNUM-1:0] htif_words, next_htif_words, words, next_words;
  reg [MAX_BYTES_BITNUM-1:0] num_in_bytes, num_in_bytes_c;
  reg [MAX_BYTES_BITNUM-1:0] num_out_bytes, num_out_bytes_c;
  reg [63:0] buf_ram [MAX_PACKET_WORDS-1:0]; 
  reg [63:0] buf_ram_htif [MAX_PACKET_WORDS-1:0]; 
  reg [HTIF_DATA_WIDTH-1:0] buf_htif [MAX_PACKET_BYTES-1:0];  
 
  reg [63:0] eth2htif_data_in;
  reg        eth2htif_wen;
  wire       eth2htif_full;
  reg  [7:0] eth2htif_aux_in;
  
  wire [63:0] eth2htif_data_out;
  wire       eth2htif_rden;
  wire       eth2htif_empty;
  wire [7:0] eth2htif_aux_out;
   
  reg [63:0] htif2eth_data_in;
  reg        htif2eth_wen;
  wire       htif2eth_full;
  reg  [7:0] htif2eth_aux_in;
   
  wire [63:0] htif2eth_data_out;
  wire       htif2eth_rden;
  wire       htif2eth_empty;
  wire [7:0] htif2eth_aux_out;
  
  wire       htif_done, eth_done;
  reg        htif_flag, eth_flag;

  reg  [63:0] eth_in_bits_r;
  reg         eth_in_val_r;
  wire [15:0] htif_cmd, htif_seqno, cmd, seqno;
  wire [31:0] htif_paysize, paysize, incoming_paysize;
  wire [63:0] addr;
 // wire [63:0] payload1, payload2; //this is for 128 bits

  FIFO36_72
  #(
    .ALMOST_EMPTY_OFFSET(9'h180),
    .DO_REG(1),       // Enable output register (0 or 1)
    .EN_SYN("FALSE"), // Specifies FIFO as Asynchronous ("FALSE")
    .FIRST_WORD_FALL_THROUGH("TRUE") // Sets the FIFO FWFT to "TRUE" or "FALSE"
  )
  eth_to_htif
  (
    .RST(rst),

    .WRCLK(clk),
    .DI(eth2htif_data_in),
    .DIP(eth2htif_aux_in),
    .WREN(eth2htif_wen),
    .FULL(eth2htif_full),
    .ALMOSTFULL(),
    .WRCOUNT(),
    .WRERR(),

    .RDCLK(clk_offchip),
    .DO(eth2htif_data_out),
    .DOP(eth2htif_aux_out),
    .RDEN(eth2htif_rden),
    .EMPTY(eth2htif_empty),
    .ALMOSTEMPTY(),
    .RDCOUNT(),
    .RDERR(),

    .DBITERR(),
    .SBITERR(),
    .ECCPARITY()
  );

  
  FIFO36_72
  #(
    .DO_REG(1),       // Enable output register (0 or 1)
    .EN_SYN("FALSE"), // Specifies FIFO as Asynchronous ("FALSE")
    .FIRST_WORD_FALL_THROUGH("TRUE") // Sets the FIFO FWFT to "TRUE" or "FALSE"
  )
  htif_to_eth
  (
    .RST(rst),

    .WRCLK(clk_offchip),
    .DI(htif2eth_data_in),
    .DIP(htif2eth_aux_in),
    .WREN(htif2eth_wen),
    .FULL(htif2eth_full),
    .ALMOSTFULL(),
    .WRCOUNT(),
    .WRERR(),

    .RDCLK(clk),
    .DO(htif2eth_data_out),
    .DOP(htif2eth_aux_out),
    .RDEN(htif2eth_rden),
    .EMPTY(htif2eth_empty),
    .ALMOSTEMPTY(),
    .RDCOUNT(),
    .RDERR(),

    .DBITERR(),
    .SBITERR(),
    .ECCPARITY()
  );
    
 always @(posedge clk)
  begin
    if (rst)
    begin
      eth2htif_data_in <= '0;
      eth2htif_aux_in <= '0;
      eth_in_bits_r <= '0;
      eth_in_val_r <= 1'b0;
      eth2htif_wen <= 1'b0;
    end
    else begin
      eth_in_bits_r <= eth_in_bits;
      eth_in_val_r <= eth_in_val;
      eth2htif_data_in <= eth_in_bits_r;
      eth2htif_aux_in[7:1] <= '0;
      eth2htif_aux_in[0] <= eth_done;
      eth2htif_wen <= eth_in_val_r;
    end
  end

  /*always @(posedge clk) 
  begin
    if (rst) 
    begin
      eth_out_bits <= '0;
      eth_out_val <= 1'b0;
    end
    else
    begin
      eth_out_bits <= buf_ram[words];
      eth_out_val  <= eth_state == state_eth_write;
    end
  end*/

  
   
  assign htif2eth_rden = (eth_state == state_take_htif) & ~htif2eth_empty;
  assign eth_done = (eth_state == state_eth_read) & (words == 1+incoming_paysize[31:3]);
  //assign eth2htif_wen = (eth_state == state_eth_read) && eth_in_val_r;
 
  always @(posedge clk)
  begin
    if (rst) begin
      for (i=0; i<MAX_PACKET_WORDS; i=i+1)
          buf_ram[i] <= '0;
      htif_flag <= 1'b0;
    end
    else 
    begin
      if (eth_in_val_r)
         buf_ram[words] <= eth_in_bits_r;
      else
      begin
     //   if (eth_state == state_take_htif) 
     //   begin 
          if (~htif2eth_empty) 
          begin
            buf_ram[words] <= htif2eth_data_out[63:0];    
            htif_flag <= htif2eth_aux_out[0];
          end
      //  end
        else
        begin
          htif_flag <= 1'b0;
        end
      end
    end
  end  

  assign {paysize,seqno,cmd} = rst ? '0 : buf_ram[0];
//  assign  addr = buf_ram[1];
 // assign  payload1 = buf_ram[2];
//  assign  payload2 = buf_ram[3];
 
  assign  cmd_val = cmd == cmd_read_mem || cmd == cmd_write_mem ||
              cmd == cmd_read_cr  || cmd == cmd_write_cr  ||
              cmd == cmd_start    || cmd == cmd_stop;
  assign  seqno_val = '1;
  
  
  assign paysize_val = (cmd == cmd_write_mem || cmd == cmd_read_mem) ? (paysize == 16)
                      : (cmd == cmd_write_cr || cmd == cmd_read_cr) ?  (paysize == 8)
                      :                                                (paysize == 0);


   assign  incoming_paysize = (cmd == cmd_read_mem || cmd == cmd_read_cr) ? 0 : paysize; //here is where we reset the paysize for read cmd
    
   always @(*)
     begin
       next_words = '0; 
       case (eth_state)
         state_eth_read: begin
               next_eth_state = words == MAX_PACKET_WORDS      ? state_eth_error   /*if we want to send more than max_packet_words -> error*/
                          : words == 1 && !paysize_val     ? state_eth_error   /*if the paysize is not 0 than it has to be either read or write*/
                          : words == 1 && !cmd_val         ? state_eth_error   /*if we want to send at least two words and cmd is ack or nack -> error*/
                          : words == 1 && !seqno_val       ? state_eth_error   /*if we are sending at least 2 words seqno_val has to be 1, but seqno is always 1???*/
                          : words == 0                     ? state_eth_read   
                          : eth_in_val_r && words == 1+incoming_paysize[31:3] ? state_take_htif /*if we read all the packets from the host go to process, */
                          :                                  state_eth_read;        /*if not, keep reading*/ 
              next_words = next_eth_state == state_take_htif ? '0 : words + eth_in_val_r;
            end
         state_take_htif: begin
              next_eth_state = htif_flag ? state_eth_write
                             : state_take_htif;
             next_words = next_eth_state == state_eth_write ? '0 : words + (!htif2eth_empty); 
          end
   
         state_eth_write:
         begin
                  next_eth_state = eth_in_val              ? state_eth_error
                             : eth_out_rdy && words == 1+paysize[31:3] ? state_eth_read 
                             :                                      state_eth_write; /*this state is waiting for the response of the target (out_rdy)*/
                  next_words = next_eth_state == state_eth_read ? '0 : words + eth_out_rdy;        
         end
            
         state_eth_error: begin
               next_eth_state = state_eth_error;
         end
            
         default: begin
              next_eth_state = state_eth_read;
         end
       endcase
   end  
  
    always @(posedge clk)
    begin
      if(rst)
      begin
        words <= '0;
        eth_state <= state_eth_read;
      end
      else
      begin
        words <= next_words;
        eth_state <= next_eth_state;
      end
    end

      assign eth_in_rdy = rst ? 1'b0 : eth_state == state_eth_read;
      assign eth_out_bits = rst ? '0 : buf_ram[words];
      assign eth_out_val = rst ? 1'b0: (eth_state == state_eth_write);
   //   assign eth_out_val = state_eth == state_eth_write;
   //   assign eth_out_bits = buf_ram[words];
      assign error_eth = eth_state == state_eth_error;


   always @(posedge clk_offchip)
   begin
    if (rst ) begin
       for (i=0; i < MAX_PACKET_WORDS; i=i+1) 
         buf_ram_htif[i] <= '0;
       eth_flag <= 1'b0;
    end
    else begin
                
       if(~eth2htif_empty) begin
              buf_ram_htif[htif_words] <= eth2htif_data_out;
                         eth_flag      <= eth2htif_aux_out[0];
       end
       else
       begin
         eth_flag <= 1'b0;
         if(htif_state != state_put_htif && next_htif_state == state_put_htif)
             buf_ram_htif[0] <= {htif_cmd == cmd_read_mem  ? 32'd16 : (htif_cmd == cmd_read_cr) ? 32'd8 : 32'd0, htif_seqno, 8'b0, buf_htif[1],buf_htif[0]}; 
     
         if(htif_state == state_htif_receive && (htif_cmd == cmd_read_cr || htif_cmd == cmd_read_mem))
         begin
               buf_ram_htif[2] <= htif_cmd == cmd_read_cr ? {32'd0,buf_htif[9],buf_htif[8], buf_htif[7],buf_htif[6],buf_htif[5], buf_htif[4], buf_htif[3],buf_htif[2]}
                                : {buf_htif[17],buf_htif[16],buf_htif[15],buf_htif[14],buf_htif[13],buf_htif[12],buf_htif[11],buf_htif[10],
                                   buf_htif[9],buf_htif[8],buf_htif[7], buf_htif[6], buf_htif[5], buf_htif[4], buf_htif[3], buf_htif[2]};

               buf_ram_htif[3] <= htif_cmd == cmd_read_cr ?  64'd0 
                                : {buf_htif[33],buf_htif[32],buf_htif[31],buf_htif[30],buf_htif[29],buf_htif[28],buf_htif[27],buf_htif[26],
                                   buf_htif[25],buf_htif[24],buf_htif[23],buf_htif[22],buf_htif[21],buf_htif[20],buf_htif[19],buf_htif[18]};

        end
       end
       
     end
   end
        
  always @(posedge clk_offchip)
  begin 
     if (rst)
        for (i=0;i<MAX_PACKET_BYTES; i=i+1)
       buf_htif[i] <= '0;
     else begin
       if (htif_out_val)
         buf_htif[bytes] <=htif_out_bits;
       else
       begin
            if(htif_state != state_htif_send && next_htif_state == state_htif_send)
            begin

            buf_htif[1] <= htif_cmd[7:4];
            buf_htif[0] <= htif_cmd[3:0];
            end       
            if (htif_state == state_htif_send) begin
                if (htif_cmd != cmd_stop)
                begin
                    for (i=2; i<10; i=i+1)
                    begin
                      for (j=0; j<4; j=j+1)
                        begin
                           
                          buf_htif[i][j] <= buf_ram_htif[1][4*(i-2)+j];
                        end
                    end
                    
                   
                    if (htif_cmd==cmd_write_mem)
                    begin
                     for (i=10; i<26; i=i+1)
                    begin
                       for (j=0; j<4; j=j+1)
                         buf_htif[i][j] <= buf_ram_htif[2][4*(i-10)+j];                     
                      
                    end
                        
                    for (i=26; i<42; i=i+1)
                    begin
                      for (j=0; j<4; j=j+1)
                        buf_htif[i][j] <= buf_ram_htif[3][4*(i-26)+j];                     
                                   
                    end
                   
                  end
                    else if (htif_cmd == cmd_write_cr)
                    begin
                      for (i=10; i<18; i=i+1)
                       begin
                         for (j=0; j<4; j=j+1)
                            buf_htif[i][j] <= buf_ram_htif[2][4*(i-10)+j];                     
                       end
                   
                   end
                end
    
              
            end
        end
      end
  end
        
  assign {htif_paysize,htif_seqno,htif_cmd} = rst ? '0 : buf_ram_htif[0];
  assign eth2htif_rden = (htif_state == state_take_eth) & (~eth2htif_empty);
 // assign htif2eth_wen = (htif_state == state_put_htif);

  //assign htif2eth_data_in = (htif_state == state_put_htif) ? buf_ram_htif[htif_words] : '0;
  assign htif_done = (htif_state == state_put_htif) & (htif_words == 1+htif_paysize[31:3]);
always @(posedge clk_offchip)
  begin
    if (rst)
    begin
      htif2eth_data_in <= '0;
      htif2eth_aux_in <= '0;
      htif2eth_wen <= '0;
    end
    else begin
      htif2eth_data_in[63:0] <= buf_ram_htif[htif_words];
      htif2eth_aux_in[7:1] <= '0;
      htif2eth_aux_in[0]   <= htif_done;
      htif2eth_wen <= htif_state == state_put_htif;   
    end
  end
  
  
   always @(*) 
    begin
      next_bytes = '0;
      next_htif_words = '0;
      num_in_bytes_c = num_in_bytes;
      num_out_bytes_c = num_out_bytes;        
      case(htif_state)
 
        state_htif_idle: begin
          next_htif_state = ~eth2htif_empty ? state_take_eth
                          :                   state_htif_idle;
        end 
        state_take_eth: begin
              
                  case (htif_cmd)
                    cmd_read_mem: begin
                          num_in_bytes_c = MAX_PACKET_IN_RDMEM;
                          num_out_bytes_c = MAX_PACKET_OUT_RDMEM;
                      end
                   cmd_write_mem: begin
                          num_in_bytes_c = MAX_PACKET_IN_WRMEM;
                          num_out_bytes_c = MAX_PACKET_OUT_WRMEM;
                      end
                   cmd_read_cr: begin
                          num_in_bytes_c = MAX_PACKET_IN_RDCR;
                          num_out_bytes_c = MAX_PACKET_OUT_RDCR;
                      end
                   cmd_write_cr: begin
                          num_in_bytes_c = MAX_PACKET_IN_WRCR;
                          num_out_bytes_c = MAX_PACKET_OUT_WRCR;
                      end
                   cmd_start: begin
                          num_in_bytes_c = MAX_PACKET_IN_START;
                          num_out_bytes_c = MAX_PACKET_OUT_START;
                      end
                   cmd_stop: begin
                          num_in_bytes_c = MAX_PACKET_IN_STOP;
                          num_out_bytes_c = MAX_PACKET_OUT_STOP;
                      end
                   default: begin
                          num_in_bytes_c = 0;
                          num_out_bytes_c = 0;
                     end

                endcase
               
                next_htif_state = htif_out_val ? state_htif_error
                                : eth_flag     ? state_htif_send
                                :                state_take_eth;
                next_htif_words = next_htif_state == state_htif_send ? '0 : htif_words + (!eth2htif_empty); 
  
            end
         
            state_htif_send:
            begin
                next_htif_state = htif_in_rdy && bytes+1 == num_in_bytes ? state_htif_receive
                                : state_htif_send;
                next_bytes = next_htif_state == state_htif_receive ? '0 : bytes + htif_in_rdy;
            
            end
          
            state_htif_receive:
            begin 
                next_htif_state = eth_in_val        ? state_htif_error
                           : bytes == num_out_bytes ? state_put_htif  //: htif_out_val && bytes+1 == num_out_bytes ? state_write
//we want to make sure that we have something to send back to the ethernet, that is why we wait all the bytes to arrive from htif
                           : state_htif_receive;
                next_bytes =  bytes + htif_out_val; // next_state == state_write ? '0 :
            end
           
           state_put_htif:
           begin
              next_htif_state = htif_words == 1+htif_paysize[31:3] ? state_htif_idle
                              :                                      state_put_htif;
              next_htif_words = next_htif_state == state_htif_idle ? '0 : htif_words + 1;
           end
  
           state_htif_error: begin
               next_htif_state = state_htif_error;
            end
            
            default: begin
              next_htif_state = state_htif_idle;
            end
          endcase
        end
      
      always @(posedge clk_offchip)
    begin
      if(rst)
      begin
        bytes <= '0;
        htif_words <= '0;
        num_in_bytes <= '0;
        num_out_bytes <= '0;
        htif_state <= state_htif_idle;
      end
      else
      begin
        bytes <= next_bytes;
        htif_words <= next_htif_words;
 	      num_in_bytes <= num_in_bytes_c;
 	      num_out_bytes <= num_out_bytes_c;
        htif_state <= next_htif_state;
      end
    end
    
     assign htif_out_rdy = htif_state == state_htif_receive;
      assign htif_in_bits = buf_htif[bytes];
      assign htif_in_val = htif_state == state_htif_send;   
   
      assign error_htif = htif_state == state_htif_error;
     
    endmodule
  
