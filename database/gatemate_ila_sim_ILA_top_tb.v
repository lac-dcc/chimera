`timescale 1 ns/10 ps

//  Simulation der Logik:
//  iverilog -D sim -o ILA_top_tb.vvp example_DUT/blink/src/*.v sim/ILA_top_tb.v sim/SPI_master.v src/storage/* src/*.v 
//  vvp ILA_top_tb.vvp -lxt2
//
// Post-Synthse:
// iverilog -Winfloop -g2012 -gspecify -Ttyp -o sim/synth_sim.vvp ../../bin/yosys/share/gatemate/cells_sim.v net/ILA_top_synth.v sim/ILA_top_tb.v sim/SPI_master.v
// vvp sim/synth_sim.vvp -lxt2
//
// Post-Implementation Symulation:
//
//  iverilog -Winfloop -g2012 -gspecify -Ttyp -o sim/impl_sim.vvp sim/fpga_ram/* ../../bin/p_r/cpelib.v ILA_top_00.v sim/ILA_top_tb.v sim/SPI_master.v 
//  vvp sim/impl_sim.vvp -lxt2

// Within the module "cc_pll," the sampling frequency needs to be configured.
module CC_PLL #(
  parameter PLL_CFG = 96'b0,
  parameter REF_CLK = "", // e.g. "10.0"
  parameter OUT_CLK = "", // e.g. "50.0"
  parameter PERF_MD = "", // LOWPOWER, ECONOMY, SPEED
  parameter LOW_JITTER = 1,
  parameter CI_FILTER_CONST = 2,
  parameter CP_FILTER_CONST = 4
  )(
  input CLK_REF, CLK_FEEDBACK, USR_CLK_REF,
  input USR_LOCKED_STDY_RST, USR_SET_SEL,
  output USR_PLL_LOCKED_STDY, USR_PLL_LOCKED,
  output CLK270, CLK180, CLK90, CLK0, CLK_REF_OUT
  );

  //parameter clk_freq = 40000000; // 40 MHz clk 
  reg clk_out;
  always 
  begin  
    clk_out <= 1'b1;
    #25.5;// (1.0/40000000/2);
    clk_out <= 1'b0;
    #25.5;//(1.0/40000000/2);
  end
  assign CLK180 = clk_out;
  endmodule

  `ifdef sim
 module CC_BUFG (
   input I,
   output O);
   assign O = I;
 endmodule
 `endif
 module CC_USR_RSTN (
  output reg USR_RSTN);
  initial
    begin
      USR_RSTN <= 0;
      #2000;
      USR_RSTN <= 1;
    end
endmodule


module ila_top_tb;
// #################################################################################################
// # ********************************************************************************************* #
    // Implement Logik for SUT
	wire  led_w;
// #################################################################################################
    // ILA configuration

  parameter bits_samples_count = 9;
  parameter sampling_freq_MHz = "10.0";
  parameter samples_count = 2**(bits_samples_count+1);
  parameter sample_width = 5;
  parameter PK_PER_DATA = ((sample_width-1)/8)+1;
  parameter all_bytes = PK_PER_DATA*samples_count;
  parameter send_pattern_true = 0;
  parameter BRAM_matrix_wide = 1;
  parameter BRAM_matrix_deep = 1;
  reg clk_ILA, spi_clk, reset_r;
  wire ss_r, miso_r, mosi_r;
  wire rst_sig = 1;

    ila_top #(
      .sample_width(sample_width), 
      .sampling_freq_MHz(sampling_freq_MHz),
      .BRAM_matrix_wide(BRAM_matrix_wide),
      .BRAM_matrix_deep(BRAM_matrix_deep)

      ) UUT ( 
        .i_sclk_ILA(spi_clk), 
        .i_ss_ILA(ss_r), 
        .i_mosi_ILA(mosi_r), 
        .o_miso_ILA(miso_r), 
// #################################################################################################
// # ********************************************************************************************* #
    // Input and output ports of the SUT 
        .led(led_w),
        .clk(clk_ILA) 
// #################################################################################################        
        );

    reg send_r, spi_receive_byte;
    reg [7:0] byte_to_send;
    wire [7:0] spy_rec_byte;
    wire spi_periode, cnt_end;

    SPI_master spi_m (.i_sclk(spi_clk), .i_reset(reset_r), .o_ss(ss_r), .o_mosi(mosi_r), .i_miso(miso_r), 
                      .i_send(send_r), .i_send_byte(byte_to_send), .i_receive(spi_receive_byte), .o_receive_byte(spy_rec_byte),
                      .o_period(spi_periode), .o_cnt_end(cnt_end));

always   // 10 MHz 
begin  
  clk_ILA = 1'b1;
  #50;
  clk_ILA = 1'b0;
  #50;
end

initial
begin

  $display("All defined samples: %d", samples_count);
  $display("all defined bytes: %d", all_bytes);
  $display("Bytes per Sample: %d", PK_PER_DATA);
    reset_r = 0;
    #3000;
    reset_r = 1;
end


always   // 1 MHz SPI_clk
begin  
  spi_clk = 1'b1;
  #500;
  spi_clk = 1'b0;
  #500;
end



parameter [4:0] s_start_analyse = 0,						// Initialization states
                s_wait_for_ILA = 1,
                reset_slave = 4,
                s_get_Signals = 2,
                s_receive_Signals = 3,
                wait_for_cnt_end = 5,
                get_data = 6,
                wait_little = 7,
                change_trigger = 8,
                send_trigger_data = 9,
                change_trigger_activation = 10,
                change_trigger_activation_data = 11,
                receive_trigger_echo = 12,
                get_trigger_echo = 13,
                receive_trigger_activation_echo = 14,
                get_trigger_activation_echo = 15,
                break_trigger_echo = 16,
                break_trigger_activation_echo = 17,
                send_reset = 18,
                send_reset_reset = 19,
                send_pattern = 20,
                send_pattern_data = 21,
                shift_pattern = 22,
                receive_pattern_echo = 23,
                get_pattern_echo = 24,
                break_pattern_echo = 25,
                st_spi_first_byte = 26;


integer counter_rec_bytes_spi;
integer counter_samples = 0;
            
            

reg [4:0] st_spi;

parameter receive_bits = (PK_PER_DATA*8)-1;

reg [receive_bits:0] rec_data;
integer byte_counter_spi;

integer counter_break;

reg cnt_end_save;

reg [11:0] trigger_data = 12'b000000000001;
reg [3:0] trigger_activation = 4'b0001;

reg start_new;

parameter bytes_to_send = ((sample_width-1)/4)+1;

parameter rest = ((bytes_to_send*4)-sample_width);

reg [(bytes_to_send*4)-1:0] bit_pattern = {{rest{1'b1}} ,25'b1111111111111111111111111};
reg [(bytes_to_send*4)-1:0] bit_maske =   {{rest{1'b1}}, 25'b1111111111111110000000000};



integer counter_ila_break;

integer count_shift_pattern = 0;


    always @(posedge spi_clk) begin
      if (!reset_r) begin
        spi_receive_byte <= 1'b0;
        byte_to_send <= 0;
        send_r <= 0;
        st_spi <= send_pattern;
        rec_data <= 0;
        counter_rec_bytes_spi <= 0;
        counter_samples <= 0;
        counter_break <= 0;
      end
      else 
        case (st_spi)
          send_reset : begin
            send_r <= 1;
            spi_receive_byte <= 1'b0;
            byte_to_send <= 8'b10101111; //00101010;
            if (spi_periode) begin
              if (send_pattern_true == 1) begin
                st_spi <= send_pattern;
                counter_break <= 0;
              end
              else begin
                st_spi <= change_trigger;
              end

            end
          end
          send_pattern : begin
            spi_receive_byte <= 1'b0;
            send_r <= 1;
            byte_to_send <= 8'b11001100;
            count_shift_pattern <= 0;
            if (spi_periode) begin
              st_spi <= send_pattern_data;
            end
          end
          send_pattern_data : begin
            byte_to_send <= {bit_maske[(bytes_to_send*4)-1:(bytes_to_send*4)-4], bit_pattern[(bytes_to_send*4)-1:(bytes_to_send*4)-4]};
            if (spi_periode) begin
              if (count_shift_pattern < (bytes_to_send)) begin
                st_spi <= shift_pattern;
              end
              else begin
                st_spi <= receive_pattern_echo;
              cnt_end_save <= 0; 
              spi_receive_byte <= 1'b1;
              send_r <= 0;
            end
          end
        end
          shift_pattern : begin
              bit_pattern <= {bit_pattern[(bytes_to_send*4)-5:0], 4'b0000};
              bit_maske <= {bit_maske[(bytes_to_send*4)-5:0], 4'b0000};
              count_shift_pattern <= count_shift_pattern +1;
              st_spi <= send_pattern_data;
             
          end
          receive_pattern_echo : begin
            if(cnt_end & !cnt_end_save ) begin
              spi_receive_byte <= 1'b0;
              send_r <= 0;
              cnt_end_save <= 1;
            end
            else if (cnt_end & cnt_end_save ) begin
              st_spi <= get_pattern_echo;
              spi_receive_byte <= 1'b0;
              send_r <= 0;
            end
          end
          get_pattern_echo : begin
            $display("pattern echo receive: %h", {spy_rec_byte});
            spi_receive_byte <= 1'b0;
            send_r <= 0;
            counter_break <= 0;
            st_spi <= break_pattern_echo;// change_trigger_activation;
          end

          break_pattern_echo : begin
            spi_receive_byte <= 1'b0;
            send_r <= 0;
            if (counter_break < 4) begin
              counter_break <= counter_break +1;
            end
            else begin
              st_spi <= change_trigger;
            end
          end
          change_trigger : begin
            spi_receive_byte <= 1'b0;
            send_r <= 1;
            byte_to_send <= {4'b1001, trigger_data[11:8]};
            if (spi_periode) begin
              st_spi <= send_trigger_data;
            end
          end
          send_trigger_data : begin
              byte_to_send <= trigger_data[7:0];
            if (spi_periode) begin
              st_spi <= receive_trigger_echo; //change_trigger_activation;
              cnt_end_save <= 0; 
              spi_receive_byte <= 1'b1;
              send_r <= 0;
            end
          end
          receive_trigger_echo : begin
            if(cnt_end & !cnt_end_save ) begin
              spi_receive_byte <= 1'b0;
              send_r <= 0;
              cnt_end_save <= 1;
            end
            else if (cnt_end & cnt_end_save ) begin
              st_spi <= get_trigger_echo;
              spi_receive_byte <= 1'b0;
              send_r <= 0;
            end
          end
          
          get_trigger_echo : begin
            $display("Trigger echo receive: %h", {spy_rec_byte});
            spi_receive_byte <= 1'b0;
            send_r <= 0;
            counter_break <= 0;
            st_spi <= break_trigger_echo;// change_trigger_activation;
          end

          break_trigger_echo : begin
            spi_receive_byte <= 1'b0;
            send_r <= 0;
            if (counter_break < 4) begin
              counter_break <= counter_break +1;
            end
            else begin
              st_spi <= change_trigger_activation;
            end

          end

          change_trigger_activation : begin
            if (spi_periode) begin
              st_spi <= receive_trigger_activation_echo;
              spi_receive_byte <= 1'b1;
              send_r <= 0;
              cnt_end_save <= 0;
            end
            else begin
              send_r <= 1;
              byte_to_send <= {4'b0011, trigger_activation};
            end

          end
          //change_trigger_activation_data : begin
          //  send_r <= 1;
          //  byte_to_send <= trigger_activation;
          //  if (spi_periode) begin
          //    st_spi <= receive_trigger_activation_echo;
          //    cnt_end_save <= 0;
          //    send_r <= 0; 
          //    spi_receive_byte <= 1'b1;
          //  end
          //end
          receive_trigger_activation_echo : begin
            if(cnt_end & !cnt_end_save) begin
              cnt_end_save <= 1;
              spi_receive_byte <= 1'b0;
              send_r <= 0;
            end
            else if (cnt_end & cnt_end_save ) begin
              st_spi <= get_trigger_activation_echo;
              spi_receive_byte <= 1'b0;
              send_r <= 0;
            end
          end


          get_trigger_activation_echo : begin
            $display("trigger activation echo receive: %h", {spy_rec_byte});
            spi_receive_byte <= 1'b0;
            send_r <= 0;
            counter_break <= 0;
            st_spi <= break_trigger_activation_echo;// s_start_analyse;
          end

          break_trigger_activation_echo : begin
            spi_receive_byte <= 1'b0;
            send_r <= 0;
            if (counter_break < 400) begin
              counter_break <= counter_break +1;
            end
            else begin
              st_spi <= s_start_analyse;
              counter_samples <= 0;
            end

          end


          s_start_analyse : begin
            send_r <= 1;
            byte_to_send <= 8'b01010101;
            counter_rec_bytes_spi <= 0;
            if (spi_periode) begin
              st_spi <= s_wait_for_ILA;
              $display("start Analyse");
              counter_break <= 0;
            end
          end
          s_wait_for_ILA : begin
            spi_receive_byte <= 1'b1;
            send_r <= 0;
            if (spi_periode) begin
                if (spy_rec_byte == 8'b10101010) begin 
                  st_spi <= reset_slave;
                end
            end
          end
          send_reset_reset : begin
            if (cnt_end) begin
              st_spi <= send_reset;
            end
              spi_receive_byte <= 1'b0;
              send_r <= 0;
          end

          reset_slave :  begin
            if (cnt_end) begin
              st_spi <= s_get_Signals;
            end
              spi_receive_byte <= 1'b0;
              send_r <= 0;
          end
          s_get_Signals : begin
            spi_receive_byte <= 1'b0;
            send_r <= 1;
            byte_to_send <= 8'b10101010;
            if (!cnt_end) begin
              st_spi <= wait_for_cnt_end;
            end
          end
          wait_for_cnt_end : begin
            spi_receive_byte <= 1'b1;
            send_r <= 0;
            byte_to_send <= 0;
            if (cnt_end) begin    // first_byte_start_of
              st_spi <= st_spi_first_byte;
              byte_counter_spi <= 0;
              start_new = 1;
            end
          end
          st_spi_first_byte : begin
            if (cnt_end) begin    // first_byte_start_of
              if (start_new) begin
                start_new <= 0;
              end
              else begin
                st_spi <= s_receive_Signals;
                byte_counter_spi <= 0;
              end
            end
          end
          s_receive_Signals : begin
            spi_receive_byte <= 1'b1;
            send_r <= 0;
            if(cnt_end) begin
              st_spi <= get_data;
            end
          end
          get_data : begin
              if (byte_counter_spi < (PK_PER_DATA-1)) begin
                byte_counter_spi <= byte_counter_spi +1;
              end
              else begin 
                byte_counter_spi <= 0;
                counter_samples <= counter_samples +1;
                if (PK_PER_DATA > 1) begin
                  $display("%d: sample: %h", counter_samples, {spy_rec_byte, rec_data[receive_bits:8]});
                end else begin
                  $display("%d: sample: %h", counter_samples, spy_rec_byte);
                end 
              end
              if (PK_PER_DATA > 1) begin
                rec_data <= {spy_rec_byte, rec_data[receive_bits:8]};
              end 


              if (counter_rec_bytes_spi < all_bytes) begin
                counter_rec_bytes_spi <= counter_rec_bytes_spi +1; 
                st_spi <= s_receive_Signals;
              end
              else begin
                st_spi <= wait_little;
                counter_ila_break <= 0;
              end
            end
            wait_little : begin
              spi_receive_byte <= 1'b0;
              send_r <= 0;
              if(counter_ila_break < 10) begin
                counter_ila_break <= counter_ila_break +1;
              end
              else begin
                st_spi <= s_start_analyse;
                $display("analyser wird neu gestartet");
              end
            end
        endcase
        end

integer idx;
    initial
 begin
    $dumpfile("ila_top_tb.vcd");
    $dumpvars(0,ila_top_tb);
    //`ifdef sim
    for (idx = 0; idx < BRAM_matrix_deep; idx = idx + 1) begin
      $dumpvars(0,UUT.mem_control.BRAM_do_tmp[idx]);
    end
    for (idx = 0; idx < BRAM_matrix_wide; idx = idx + 1) begin
      $dumpvars(1,UUT.mem_control.data_in_pipe[idx]);
    end
      
    //`endif
 end
 initial begin
    #10000000;
    $finish;
end


endmodule