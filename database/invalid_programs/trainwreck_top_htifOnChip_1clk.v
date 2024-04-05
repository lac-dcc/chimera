`ifndef VCS
`include "riscvConst.vh"
`endif

module HTIF_onchip_1clk
(
  input  clk,
  input  rst,

  output clk_offchip,

//  input         tuning,

  input         in_val,
  input   [3:0] in_bits,
  output        in_rdy,

  input         out_rdy,
  output        out_val,
  output  [3:0]  out_bits,

  output  reg    htif_start0,
  output         htif_fromhost_wen0,
  output  [31:0] htif_fromhost0,
  input   [31:0] htif_tohost0,

  output  reg    htif_start1,
  output         htif_fromhost_wen1,
  output  [31:0] htif_fromhost1,
  input   [31:0] htif_tohost1,

  output  reg    htif_start2,
  output         htif_fromhost_wen2,
  output  [31:0] htif_fromhost2,
  input   [31:0] htif_tohost2,

  output         htif_req_val,
  input          htif_req_rdy,
  output         htif_req_op,

  output  [31:0] htif_req_addr,
  output [127:0] htif_req_data,
  output  [`MEM_TAG_BITS-1:0] htif_req_tag,

  input          htif_resp_val,
  input  [127:0] htif_resp_data,
  input   [`MEM_TAG_BITS-1:0] htif_resp_tag,

  output        error
);

parameter MAX_PACKET_BYTES = 42; //84;
parameter MAX_BYTES_BITNUM = 6; //4 for 64 bits

parameter [2:0]

    state_read_cmd = 3'b000,
    state_cmd_dcode = 3'b001,
    state_read_toend = 3'b010,
    state_process = 3'b011,
    state_cpu_req = 3'b100,
    state_cpu_wait = 3'b101,
    state_respond = 3'b110,
    state_error = 3'b111;

parameter [7:0]

  cmd_read_mem ={4'b0,4'b0000},
  cmd_write_mem ={4'b0,4'b0001},
  cmd_read_cr = {4'b0,4'b0010},
  cmd_write_cr = {4'b0,4'b0011},
  cmd_start = {4'b0,4'b0100},
  cmd_stop = {4'b0,4'b0101},
  cmd_ack = {4'b0,4'b0110},
  cmd_nack = {4'b0,4'b0111};

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



  integer i,j;
  reg [2:0] state, next_state;

  reg [MAX_BYTES_BITNUM-1:0] words, next_words;
  reg [3:0] buf_ram [MAX_PACKET_BYTES-1:0];
  reg [MAX_BYTES_BITNUM-1:0] num_in_bytes, num_in_bytes_c;
  reg [MAX_BYTES_BITNUM-1:0] num_out_bytes, num_out_bytes_c;
  reg htif_start;
  reg [3:0] in_bits_r; //needed for the reset state

  wire [7:0] cmd;
  wire [31:0] addr;
  wire cmd_val, cmd_needs_cpu_req, cmd_needs_cpu_resp;


  //this is needed for the reset state
  always @(posedge clk)
  begin
    if (rst)
      in_bits_r <= in_bits;
    else
      in_bits_r <= '0;
  end

  always @(posedge clk)
  begin
  if (rst)
    for (i=0; i < MAX_PACKET_BYTES; i=i+1)
      buf_ram[i] <= '0;
  else
  begin
    if (in_val)
      buf_ram[words] <= in_bits;
    else
    begin
      if(state != state_respond && next_state == state_respond)
      begin
        buf_ram[0] <= cmd_ack[3:0];
        buf_ram[1] <= cmd_ack[7:4];
     end
      if((state == state_process && cmd == cmd_read_cr) || (state == state_cpu_wait && cmd != cmd_start))
        if (state == state_process)
        begin
          if (addr[17:16] == 2'b00) begin
          {buf_ram[9],buf_ram[8],buf_ram[7],buf_ram[6],buf_ram[5],buf_ram[4],buf_ram[3],buf_ram[2]} <= htif_tohost0;
          end
          if (addr[17:16] == 2'b01) begin
           {buf_ram[9],buf_ram[8],buf_ram[7],buf_ram[6],buf_ram[5],buf_ram[4],buf_ram[3],buf_ram[2]} <= htif_tohost1;
          end
          if (addr[17:16] == 2'b10) begin
            {buf_ram[9],buf_ram[8],buf_ram[7],buf_ram[6],buf_ram[5],buf_ram[4],buf_ram[3],buf_ram[2]} <= htif_tohost2;
         end
        end
        else
        begin
         {buf_ram[33],buf_ram[32],buf_ram[31],buf_ram[30]} <= htif_resp_data[127:112];
         {buf_ram[29],buf_ram[28],buf_ram[27],buf_ram[26]} <= htif_resp_data[111:96];
         {buf_ram[25],buf_ram[24],buf_ram[23],buf_ram[22]} <= htif_resp_data[95:80];
         {buf_ram[21],buf_ram[20],buf_ram[19],buf_ram[18]} <= htif_resp_data[79:64];
         {buf_ram[17],buf_ram[16],buf_ram[15],buf_ram[14]} <= htif_resp_data[63:48];
         {buf_ram[13],buf_ram[12],buf_ram[11],buf_ram[10]} <= htif_resp_data[47:32];
         {buf_ram[9],buf_ram[8],buf_ram[7],buf_ram[6]} <= htif_resp_data[31:16];
         {buf_ram[5],buf_ram[4],buf_ram[3],buf_ram[2]} <= htif_resp_data[15:0];
          
       end
      end
    end
  end

  assign cmd = {buf_ram[1],buf_ram[0]};
  assign addr = {buf_ram[9],buf_ram[8],buf_ram[7],buf_ram[6],buf_ram[5],buf_ram[4],buf_ram[3],buf_ram[2]};
  
  assign cmd_val = cmd == cmd_read_mem || cmd == cmd_write_mem ||
                   cmd == cmd_read_cr  || cmd == cmd_write_cr  ||
                   cmd == cmd_start    || cmd == cmd_stop;
  assign cmd_needs_cpu_resp = cmd == cmd_read_mem || cmd==cmd_start;
  assign cmd_needs_cpu_req  = cmd_needs_cpu_resp || cmd == cmd_write_mem;

  always @(posedge clk)
  begin
    if(rst)
    begin
      words <= '0;
      state <= state_read_cmd;
      num_in_bytes <= '0;
      num_out_bytes <= '0;
    end
    else
    begin
      words <= next_words;
      state <= next_state;
      num_in_bytes <= num_in_bytes_c;
      num_out_bytes <= num_out_bytes_c;
    end

    if(rst)
    begin
      htif_start <= 1'b0;
      htif_start0 <= 1'b0;
      htif_start1 <= 1'b0;
      htif_start2 <= 1'b0;
    end
    else if(state == state_process && cmd == cmd_stop || next_state == state_respond && cmd == cmd_start)
    begin
      htif_start <= (cmd == cmd_start);
      htif_start0 <= (cmd == cmd_start) && (addr[17:16] == 2'b00);
      htif_start1 <= (cmd == cmd_start) && (addr[17:16] == 2'b01);
      htif_start2 <= (cmd == cmd_start) && (addr[17:16] == 2'b10);
    end
  end

  always @(*)
  begin
    next_words = '0;
    next_state = state_read_cmd;
    num_in_bytes_c = num_in_bytes;
    num_out_bytes_c = num_out_bytes;

    case(state)
      state_read_cmd:
        begin
          next_state = rst ? state_read_cmd
                     : in_val && words >= MAX_PACKET_IN_CMD ? state_error    //rst ? state_read_cmd : ... we want to stay in this state during rst
                     : in_val && words +1 == MAX_PACKET_IN_CMD ? state_cmd_dcode
                     : state_read_cmd;
          next_words = words + in_val;
        end

      state_cmd_dcode:
        begin
          case ({buf_ram[1],buf_ram[0]})
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
          next_state = !cmd_val ? state_error
                    : in_val && (cmd == cmd_stop) ? state_error
                    : (cmd == cmd_stop) ? state_process
                    : state_read_toend;  //we need to go to state_process for at least one cycle so that we can load the buf with tohost reg
          next_words = words + in_val;
        end

      state_read_toend:
        begin
          next_state = !in_val ? state_error
                     : in_val && words+1 == num_in_bytes ? state_process
                     : state_read_toend;
          next_words = words + in_val;
        end

      state_process:
        begin
          next_state = in_val                       ? state_error  /*we read everything, so if the host is sending more -> error*/
                   : cmd == cmd_start && htif_start ? state_error  /*if the cmd was to start and htif_start==1 -> error, why? */
                   : cmd == cmd_stop && !htif_start ? state_error  /*if the cmd is to stop and htif_start==0 -> error, why?*/
                   : cmd_needs_cpu_req              ? state_cpu_req /*if cmd is rd mem of start or wr mem, go to cpu_req, if not go to respond*/
                   :                                  state_respond;
        end

      state_cpu_req:
        begin
          next_state = in_val                             ? state_error /*we still didnt reply to the host, so if it sends something more->error*/
                     : htif_req_rdy && cmd_needs_cpu_resp ? state_cpu_wait /*if we are done with processing and cmd was read or start go to cpu_wait?*/
                     : htif_req_rdy                       ? state_respond /*if we are done and was none of the above, it was write cmd and we go to respond*/
                     :                                      state_cpu_req; /*if we are not done, just stay in this state*/
        end

      state_cpu_wait:
        begin
          next_state = in_val        ? state_error
                     : htif_resp_val ? state_respond  /*apparently there it has to wait for this additional signal before it goes to respond, but not sure why?*/
                     :                 state_cpu_wait;
        end

      state_respond:
        begin
          next_state = in_val                              ? state_error
                     : out_rdy && words+1 == num_out_bytes ? state_read_cmd  //i have to see where does out_rdy come from and what it would be for start or stop cmd
                     :                                       state_respond; /*this state is waiting for the response of the target (out_rdy)*/
          next_words = next_state == state_read_cmd ? '0 : words + out_rdy; /*reset the words if going back to read, if not it waits for all data to arrive*/
        end

      state_error:
        begin
          next_state = state_error;
        end

    endcase
  end

  assign in_rdy = rst ? 1'b0 : (state==state_read_cmd || state == state_read_toend || state==state_process || (state==state_cmd_dcode && (cmd != cmd_stop)));
  assign out_val = rst ? 1'b0 : state == state_respond;
  assign out_bits = rst ? in_bits_r : buf_ram[words];

 assign htif_fromhost0 = rst ? '0 : {buf_ram[17],buf_ram[16],buf_ram[15],buf_ram[14],buf_ram[13],buf_ram[12],buf_ram[11],buf_ram[10]}; 
 

  assign htif_fromhost1 = rst ? '0 :  {buf_ram[17],buf_ram[16],buf_ram[15],buf_ram[14],buf_ram[13],buf_ram[12],buf_ram[11],buf_ram[10]}; 

  assign htif_fromhost2 = rst ? '0 :  {buf_ram[17],buf_ram[16],buf_ram[15],buf_ram[14],buf_ram[13],buf_ram[12],buf_ram[11],buf_ram[10]}; 

  assign htif_fromhost_wen0 = rst ? 1'b0 : cmd == cmd_write_cr && state == state_process && addr[17:16] == 2'b00;
  assign htif_fromhost_wen1 = rst ? 1'b0 : cmd == cmd_write_cr && state == state_process && addr[17:16] == 2'b01;
  assign htif_fromhost_wen2 = rst ? 1'b0 : cmd == cmd_write_cr && state == state_process && addr[17:16] == 2'b10;

  assign htif_req_val = rst ? 1'b0 : state == state_cpu_req;
  assign htif_req_op = (cmd == cmd_write_mem && state != state_read_cmd && state != state_cmd_dcode && state != state_read_toend) ? 1'b1
		               : 1'b0;

   assign htif_req_addr = addr;
   assign htif_req_data[127:112] = {buf_ram[41],buf_ram[40],buf_ram[39],buf_ram[38]};
   assign htif_req_data[111:96] =  {buf_ram[37],buf_ram[36],buf_ram[35],buf_ram[34]};
   assign htif_req_data[95:80] = {buf_ram[33],buf_ram[32],buf_ram[31],buf_ram[30]};
   assign htif_req_data[79:64] =  {buf_ram[29],buf_ram[28],buf_ram[27],buf_ram[26]};
   assign htif_req_data[63:48] =  {buf_ram[25],buf_ram[24],buf_ram[23],buf_ram[22]};
   assign htif_req_data[47:32] =  {buf_ram[21],buf_ram[20],buf_ram[19],buf_ram[18]};
   assign htif_req_data[31:16] =  {buf_ram[17],buf_ram[16],buf_ram[15],buf_ram[14]};
   assign htif_req_data[15:0] =  {buf_ram[13],buf_ram[12],buf_ram[11],buf_ram[10]};
    
   assign htif_req_tag = '0;

  assign error = state == state_error;

endmodule
