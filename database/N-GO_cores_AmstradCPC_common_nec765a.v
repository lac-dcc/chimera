// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

module nec765 (
  input wire clk,
  input wire rst_n,
  output wire[7:0] dout,
  input wire[7:0] din,
  input wire ce,
  input wire a0,
  input wire motorctl,
	input wire[7:0] disk_data_in,
	output wire[7:0] disk_data_out,
	output reg[31:0] disk_sr,
	input wire[31:0] disk_cr,
	input wire disk_data_clkout,
	input wire disk_data_clkin,
	input wire[1:0] disk_wp,
	input wire rd_n,
	input wire wr_n,
	output wire[31:0] debug
);

// FIFOS copied from WD1770 - not fully working
  wire[7:0] fifo_out_data;
  wire fifo_empty;
  wire fifo_lastbyte;
  reg fifo_reset = 1'b0;
  reg fifo_out_read = 1'b0;
  reg side_latched = 1'b0;
  wire fifo_in_full;

//wd1770 regs
  reg drsel = 0;
  reg motor_on = 1'b0;

  // ctrl-module transfer state machine
  localparam IDLE = 0;
  localparam READSECT = 1;
  localparam READING = 2;
  localparam WRITING = 3;
  localparam COMMIT = 4;
  localparam SEEKING = 5;
  localparam READID = 6;
  localparam STARTWRITE = 7;
  reg[2:0] state = IDLE;
  
  // disk to cpu - reading
  fifo #(.RAM_SIZE(512), .ADDRESS_WIDTH(9)) fifo_in(
    .q(fifo_out_data),
    .d(disk_data_in),
    .clk(clk),
    .write(disk_data_clkin),
    .read(fifo_out_read),
    .reset(fifo_reset),
    .empty(fifo_empty),
    .lastbyte(fifo_lastbyte));

  reg fifo_in_write = 1'b0;
  reg[9:0] fifo_in_size = 1'b0;
  wire fifo_out_empty;
  reg last_byte_read = 1'b0;

  // cpu to disk - writing
  fifo #(.RAM_SIZE(512), .ADDRESS_WIDTH(9)) fifo_out(
    .q(disk_data_out),
    .d(din),
    .clk(clk),
    .write(fifo_in_write),
    .read(disk_data_clkout),
    .reset(fifo_reset),
    .empty(fifo_out_empty),
    .full(fifo_in_full)
    );




reg prev_rd_n = 1'b1;
reg prev_wr_n = 1'b1;

// flags are hd,us1,us0 (head, unit select 1:0) note h is always = hd
// r = record = sector id
// n = number of bytes in sector
// c = cylinder
// h = head
// eot = final sector number
// gpl = gap length - can be ignored i think
// dtl = data length for read/write to/from sector
// st0 = {ic[1:0],seek_end, no_track0_equipment_fail, not_ready, hd_at_int, us[1:0]}
// st1 = {eoc, 0, data_error, overrun, 0, no_data, wp, missing_address_mark(notformatted)}
// st2 = {0, cm, crc_error, wrong_cylinder, scan_equal_hit, scan_not_found, bad_cylinder, missing_address_mark}
// st3 = {fault_fdd, wp_fdd, rdy_fdd, trk0_fdd, 2side_fdd, sideselect_fdd, us[1:0]}
// cm = data deleted mark encoutnered
// ic = 00:ok 01:abnormal_term 10:inv_command 11:physically_interrupted
// not_ready = could mean sector is not there on read/write command
// hd_at_int = which head used at interrupt
// eoc - end of cylinder - try to find sector beyond last one

// msr = {rfm, dio, exm, busy, fdbusy[3:0]}
// rfm = transfer pending
// dio = to cpu
// exm = execution mode - busy doing something.
// fdc = busy - command in progress

// instructions have bits {mt, mf, sk, ins[4:0]}
//  mt = multi-track - both sides - probably not needed with cpc
//  mf = fm or mfm(1) mode
//  sk = skip deleted data address mark

localparam READ_DATA          = 5'h06; // rx:f,c,h,r,n,eot,gpl,dtl tx:st0,st1,st2,c,h,r,n
localparam READ_DELETED_DATA  = 5'h0c; // rx:f,c,h,r,n,eot,gpl,dtl tx:st0,st1,st2,c,h,r,n
localparam WRITE_DATA         = 5'h05; // rx:f,c,h,r,n,eot,gpl,dtl tx:st0,st1,st2,c,h,r,n
localparam WRITE_DELETED_DATA = 5'h09; // rx:f,c,h,r,n,eot,gpl,dtl tx:st0,st1,st2,c,h,r,n

localparam READ_TRACK         = 5'h02; // rx:f,c,h,r,n,eot,gpl,dtl tx:st0,st1,st2,c,h,r,n
localparam READ_ID            = 5'h0a; // rx:f                     tx:st0,st1,st2,c,h,r,n
localparam FORMAT_TRACK       = 5'h0d; // rx:f,n,sc,gpl,d          tx:st0,st1,st2,c,h,r,n
localparam SCAN_EQUAL         = 5'h11; // rx:f,c,h,r,n,eot,gpl,dtl tx:st0,st1,st2,c,h,r,n

localparam SCAN_LEQUAL        = 5'h19; // rx:f,c,h,r,n,eot,gpl,dtl tx:st0,st1,st2,c,h,r,n
localparam SCAN_HEQUAL        = 5'h1d; // rx:f,c,h,r,n,eot,gpl,dtl tx:st0,st1,st2,c,h,r,n
localparam RECALIBRATE        = 5'h07; // rx:f                     tx:

localparam SENSE_INT_STATUS   = 5'h08; // rx:                      tx:sto,pcn
localparam SPECIFY            = 5'h03; // rx:srt-hut,hlt-nd        tx:
localparam SENSE_DRIVE_STATUS = 5'h04; // rx:f                     tx:st3
localparam SEEK               = 5'h0f; // rx:f,ncn                 tx:
localparam INVALID_INS        = 5'h1f;


// localparam SR_ACK = 16;
// localparam SR_SEEK1 = 25;
// localparam SR_SEEK0 = 24;
// localparam SR_READID0 = 22;
// localparam SR_READID1 = 23;
// localparam SR_READSECT0 = 17;
// localparam SR_READSECT1 = 18;
// localparam SR_WRITE1 = 21;
// localparam SR_WRITE0 = 20;
localparam SR_HS = 22;
localparam SR_ACK = 23;
localparam SR_READSECT0 = 24;
localparam SR_READSECT1 = 25;
localparam SR_WRITE0 = 26;
localparam SR_WRITE1 = 27;
localparam SR_READID0 = 28;
localparam SR_READID1 = 29;
localparam SR_SEEK0 = 30;
localparam SR_SEEK1 = 31;

localparam CR_SECTIDH = 31;
localparam CR_SECTIDL = 24;

localparam CR_HEADH = 15;
localparam CR_HEADL = 8;
localparam CR_DISKIN1 = 6;
localparam CR_DISKIN0 = 5;
localparam CR_DONE = 4;
localparam CR_ERROR = 3;
localparam CR_WPERROR = 2;
localparam CR_SEEKDONE1 = 1;
localparam CR_SEEKDONE0 = 0;

localparam STATUS_IDLE = 0;
localparam STATUS_CMD = 1;
localparam STATUS_EXEC = 2;
localparam STATUS_RX = 3;

reg[1:0] status = STATUS_IDLE;

// reg[7:0] results[0:7];
reg[2:0] results_len = 0;
reg[2:0] results_pos = 0;

reg[7:0] params[0:10];
// reg[3:0] params_len = 0;
reg[3:0] params_pos = 0;

wire rfm = (status == STATUS_IDLE && state != SEEKING) || 
  (status == STATUS_EXEC && state == READING && !fifo_empty) ||
  (status == STATUS_EXEC && ins[4:0] == WRITE_DATA && fifo_in_size != 512) ||
  (status == STATUS_RX && results_len != results_pos) ||
  (status == STATUS_CMD);
wire dio = status == STATUS_RX || (status == STATUS_EXEC && ins[4:0] == READ_DATA);
wire exm = status == STATUS_EXEC;
wire busy = status != STATUS_IDLE;
reg[1:0] fdcbusy = 2'b00;
reg[7:0] intstat0 = 8'h00;
reg[7:0] intstat1 = 8'h00;
reg[1:0] rdy_fdd = 2'b00;
wire not_ready[1:0] = {!disk_cr[CR_DISKIN1], !disk_cr[CR_DISKIN0]};

reg[7:0] ins;

reg bad_cylinder = 1'b0;
reg data_error = 1'b0;

reg scan_equal_hit = 1'b0;
reg scan_not_found = 1'b0;
reg wrong_cylinder = 1'b0;
reg[6:0] cylinder[0:1];
reg[7:0] sector_id = 8'hc1;
reg[7:0] sector_size = 8'h02; // 512 bytes
reg fault_fdd = 1'b0;

wire trk0_fdd[1:0] = {cylinder[1] == 7'd0, cylinder[0] == 7'd0};
reg side_fdd = 1'b0;
reg sideselect_fdd = 1'b0;
reg cm = 1'b0;
reg crc_error = 1'b0;
reg[7:0] head = 8'd0;

// TODO fake data
// reg disk_error = 1'b0;
// reg wp_error = 1'b0;
wire wp_error = disk_cr[CR_WPERROR];
reg seek_good = 1'b0;

wire[7:0] status_reg = {rfm, dio, exm, busy, 2'b00, fdcbusy[1:0]};
reg[7:0] param_out[0:6];

assign dout = 
  !ce ? 8'hff :
  !rd_n && !a0 ? status_reg :
  !rd_n && a0 && status == STATUS_EXEC && state == READING ? fifo_out_data :
  !rd_n && a0 && status == STATUS_RX ? param_out[results_pos] :
  8'hff;
  

reg was_fifo_read = 1'b0;
reg was_param_read = 1'b0;
reg[9:0] overrun_timer = 10'h3ff;

localparam INITIAL_OVERRUN_TIMER = 10'h000;
localparam NEXT_OVERRUN_TIMER = 10'h000;

always @(posedge clk) begin
  prev_rd_n <= rd_n;
  prev_wr_n <= wr_n;
  
  // fifo default values
  fifo_out_read <= 1'b0;
  fifo_in_write <= 1'b0;
  fifo_reset <= 0;
 
  // run overrun timer
  if (!(&overrun_timer)) overrun_timer <= overrun_timer + 1;
  
  // check for overrun
//   if (&overrun_timer && state == READING) begin
//     param_out[0][6] <= 1'b1;
//     param_out[1][4] <= 1'b1;
//   end
 
  // handle chip reset
  if (!rst_n) begin
    disk_sr[31:0] <= 0;
    fifo_reset <= 1;
    fifo_in_size <= 1'b0;
    state <= IDLE;
    status <= STATUS_IDLE;
  end

  // finished this cycle - advance fifo
  if (!prev_rd_n && rd_n) begin
    if (was_fifo_read) begin
      fifo_out_read <= 1'b1;
      was_fifo_read <= 1'b0;
      overrun_timer <= NEXT_OVERRUN_TIMER;
      if (&overrun_timer) begin
        param_out[0][6] <= 1'b1;
        param_out[1][4] <= 1'b1;
      end
      if (fifo_lastbyte || &overrun_timer) begin
        state <= IDLE;
        status <= STATUS_RX;
      end
    end else if (was_param_read) begin
      was_param_read <= 1'b0;
      if ((results_pos + 1) != results_len)
        results_pos <= results_pos + 1;
      else begin
        status <= STATUS_IDLE;
        results_pos <= 0;
      end
    end
  end

  // was a fifo read this cycle
  if (prev_rd_n && !rd_n && ce && a0) begin
    was_fifo_read <= status == STATUS_EXEC && state == READING;
    was_param_read <= status == STATUS_RX;
  end
  
  if (prev_wr_n && !wr_n && motorctl) begin
    motor_on <= din[0];

  end else if (prev_wr_n && !wr_n && ce && a0) begin
    // STATE: IDLE - receive instruction
    if (status == STATUS_IDLE) begin // receiving command
      params_pos <= 0;

      // move to cmd state
      ins[7:0] <= din[7:0];
      case (din[4:0])
        READ_DATA,READ_DELETED_DATA,WRITE_DATA,WRITE_DELETED_DATA,READ_TRACK,SCAN_EQUAL,SCAN_HEQUAL,SCAN_LEQUAL,FORMAT_TRACK,SEEK,SPECIFY,READ_ID,RECALIBRATE,SENSE_DRIVE_STATUS,READ_ID,RECALIBRATE,SENSE_DRIVE_STATUS: begin
          status <= STATUS_CMD;
        end
        SENSE_INT_STATUS: begin
          if (|intstat0) begin
            param_out[0] <= {intstat0[7:4], not_ready[0], 3'd0};
            param_out[1] <= cylinder[0];
            intstat0[7:0] <= 8'd0;
            results_len <= 2;
          end else if (|intstat1) begin
            param_out[0] <= {intstat1[7:4], not_ready[1], 3'd1};
            param_out[1] <= cylinder[1];
            intstat1[7:0] <= 8'd0;
            results_len <= 2;
          end else begin
            param_out[0] <= 8'h80;
            results_len <= 1;
          end
          status <= STATUS_RX;
        end
        default: begin
          status <= STATUS_RX;
          param_out[0] <= 8'h80;
          results_len <= 1;
          ins[7:0] <= INVALID_INS;
        end
      endcase
    
    end else if (status == STATUS_CMD) begin // receiving parameters
      params[params_pos] <= din;
      params_pos <= params_pos + 1;
      
      if (params_pos == 0) drsel <= din[0];
      

      if (din[0])
        rdy_fdd[1] <= motor_on ? disk_cr[CR_DISKIN1] : 1'b0;
      else
        rdy_fdd[0] <= motor_on ? disk_cr[CR_DISKIN0] : 1'b0;

      // received last parameter
      if (ins[4:0] == SENSE_DRIVE_STATUS && params_pos == 0) begin // 1
        param_out[0] <= din[0] ?
          {1'b0, disk_wp[1], rdy_fdd[1], cylinder[1] == 0 ? 1'b1 : 1'b0, side_fdd, sideselect_fdd, 2'b01} :
          {1'b0, disk_wp[0], rdy_fdd[0], cylinder[0] == 0 ? 1'b1 : 1'b0, side_fdd, sideselect_fdd, 2'b00};
        results_len <= 1;
        status <= STATUS_RX;
          
      end else if (ins[4:0] == SPECIFY && params_pos == 1) begin // 2
        status <= STATUS_IDLE;

      end else if (ins[4:0] == RECALIBRATE && params_pos == 0) begin
        state <= SEEKING;
        cylinder[din[0]] <= 8'd0;
        disk_sr[22:0] <= {head[7:0], 7'd0, sector_id[7:0]};
        disk_sr[SR_ACK] <= 1'b0;
        disk_sr[SR_SEEK1:SR_SEEK0] <= din[0] ? 2'b10 : 2'b01;
        fdcbusy[din[0]] <= 1'b1;
        status <= STATUS_IDLE;
      end else if (ins[4:0] == SEEK && params_pos == 1) begin
        state <= SEEKING;
        cylinder[drsel] <= din[7:0];
        disk_sr[22:0] <= {head[7:0], din[6:0], sector_id[7:0]};
        disk_sr[SR_ACK] <= 1'b0;
        disk_sr[SR_SEEK1:SR_SEEK0] <= drsel ? 2'b10 : 2'b01;
        fdcbusy[drsel] <= 1'b1;
        status <= STATUS_IDLE;
      end else if (ins[4:0] == READ_ID && params_pos == 0) begin
        state <= READID;
        disk_sr[SR_ACK] <= 1'b0;
        disk_sr[SR_HS] <= din[2];
        disk_sr[SR_READID1:SR_READID0] <= din[0] ? 2'b10 : 2'b01;
        status <= STATUS_EXEC;
        results_len <= 7;
      end else if ((ins[4:0] == WRITE_DATA || ins[4:0] == WRITE_DELETED_DATA) && params_pos == 7) begin
        state <= STARTWRITE;
        cylinder[drsel] <= params[1];
        head <= params[2];
        sector_id <= params[3];
        fifo_reset <= 1'b1;
        fifo_in_size <= 1'b0;
        status <= STATUS_EXEC;
      end else if ((ins[4:0] == READ_DATA || ins[4:0] == READ_DELETED_DATA) && params_pos == 7) begin
        fifo_reset <= 1'b1;
        last_byte_read <= 1'b0;
        state <= READSECT;
        disk_sr[21:0] <= {params[2][6:0], params[1][6:0], params[3][7:0]};
        disk_sr[SR_READSECT1:SR_READSECT0] <= {drsel, ~drsel};
        disk_sr[SR_HS] <= params[0][2];
        disk_sr[SR_ACK] <= 1'b0;
//         disk_sr[21:0] <= {6'b000, drsel, ~drsel, 1'b0, head[0], params[1][6:0], params[3][7:0]};

        cylinder[drsel] <= params[1];
        head <= params[2];
        sector_id <= params[3];
        status <= STATUS_EXEC;
        results_len <= 7;
        
      end else if ((ins[4:0] == FORMAT_TRACK && params_pos == 4) || params_pos == 7) begin
        results_len <= 7;
        status <= STATUS_RX;
      end
    end else if (status == STATUS_EXEC) begin // doing something
      if (ins[4:0] == WRITE_DATA) begin
        fifo_in_write <= 1'b1;
        fifo_in_size <= fifo_in_size + 1;
        if (fifo_in_size == 511) begin
          state <= COMMIT;
          if (drsel) begin
            disk_sr[SR_WRITE1:SR_WRITE0] <= 2'b10;
            disk_sr[SR_ACK] <= 1'b0;
            disk_sr[SR_HS] <= params[0][2];
            disk_sr[21:0] <= {head[6:0], cylinder[drsel][6:0], sector_id[7:0]};
          end else begin
            disk_sr[SR_WRITE1:SR_WRITE0] <= 2'b01;
            disk_sr[SR_ACK] <= 1'b0;
            disk_sr[SR_HS] <= params[0][2];
            disk_sr[21:0] <= {head[6:0], cylinder[drsel][6:0], sector_id[7:0]};
          end
        end
      end
    end
  end

  
  // write results in
  if (disk_cr[CR_DONE] && state != IDLE) begin
    param_out[0] <= {1'b0, disk_cr[CR_ERROR], 1'b0, 1'b0, not_ready[drsel], 2'b00, drsel};
    param_out[1] <= {bad_cylinder, 1'b0, disk_cr[CR_ERROR], 1'b0, 1'b0, disk_cr[CR_ERROR], wp_error, disk_cr[CR_ERROR]};
    param_out[2] <= {1'b0, cm, crc_error, wrong_cylinder, scan_equal_hit, scan_not_found, bad_cylinder, disk_cr[CR_ERROR]};
    param_out[3] <= cylinder[drsel];
    param_out[4] <= disk_cr[CR_HEADH:CR_HEADL];
    param_out[5] <= disk_cr[CR_SECTIDH:CR_SECTIDL];
    param_out[6] <= sector_size;
  end
  
  // has finished writing sector
  if (disk_cr[CR_DONE] && state == COMMIT) begin // finished command
    disk_sr[SR_WRITE1:SR_WRITE0] <= 2'b00; // reset sector write command
    disk_sr[SR_ACK] <= 1'b1; // signal ack of ack
    state <= IDLE;
    status <= STATUS_RX;
  end
  

  // has finished reading sector id
  if (disk_cr[CR_DONE] && state == READID) begin
    disk_sr[SR_READID1:SR_READID0] <= 2'b00; // reset command
    disk_sr[SR_ACK] <= 1'b1; // signal ack of ack
    sector_id[7:0] <= disk_cr[CR_SECTIDH:CR_SECTIDL];
    status <= STATUS_RX;
  end

  // has finished reading sector
  if (disk_cr[CR_DONE] && state == READSECT) begin // finished command
    disk_sr[SR_READSECT1:SR_READSECT0] <= 2'b00; // reset sector read command
    disk_sr[SR_ACK] <= 1'b1; // signal ack of ack
    if (disk_cr[CR_ERROR]) begin
      status <= STATUS_RX;
    end

    state <= disk_cr[CR_ERROR] ? IDLE : READING;
    overrun_timer <= INITIAL_OVERRUN_TIMER;
  end
  
  // has finished seeking
  if (|disk_cr[CR_SEEKDONE1:CR_SEEKDONE0] && state == SEEKING) begin // finished seek
    disk_sr[SR_SEEK1:SR_SEEK0] <= 2'b00; // reset seek
    disk_sr[SR_ACK] <= 1'b1; // signal ack of ack
    if (disk_cr[CR_SEEKDONE1]) begin
      fdcbusy[1] <= 1'b0;
      intstat1 <= {1'b0, disk_cr[CR_ERROR], ~disk_cr[CR_ERROR], 1'b0, 1'b0, 3'd1};//{2'b11, 1'b0, 1'b0, not_ready, 3'd0}
    end else begin
      fdcbusy[0] <= 1'b0;
      intstat0 <= {1'b0, disk_cr[CR_ERROR], ~disk_cr[CR_ERROR], 1'b0, 1'b0, 3'd0};//{2'b11, 1'b0, 1'b0, not_ready, 3'd0}
    end
    state <= IDLE;
  end

end

//   assign debug[31:0] = disk_cr[31:0];
  assign debug[31:0] = {
    ins[7:0],
    1'b0, cylinder[0][6:0],
//     1'b0, results_pos[2:0],
//     1'b0, results_len[2:0],
    sector_id[7:0],
//     params_pos[3:0],
//     params_len[3:0],
    fifo_empty, motor_on, status[1:0],
    disk_cr[CR_DONE], state[2:0]};

endmodule
