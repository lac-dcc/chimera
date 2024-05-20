// This program was cloned from: https://github.com/Lefteris-B/ecko_efabless
// License: Apache License 2.0

module EF_PSRAM_CTRL_V2 (
    input   wire            clk,
    input   wire            rst,
    input   wire [23:0]     addr,
    input   wire [31: 0]    data_i,
    output  wire [31: 0]    data_o,
    input   wire [2:0]      size,
    input   wire            start,
    output  wire            done,
    input   wire  [3:0]     wait_states,
    input   wire  [7:0]     cmd,
    input   wire            rd_wr,
    input   wire            qspi,
    input   wire            qpi,
    input   wire            short_cmd,
    
    output  reg             sck,
    output  reg             ce_n,
    input   wire [3:0]      din,
    output  wire [3:0]      dout,
    output  wire [3:0]      douten
);
    localparam  IDLE = 1'b0, 
                BUSY = 1'b1;

    reg         state, nstate;
    reg [7:0]   counter;
    reg [23:0]  saddr;
    reg [7:0]   data [3:0]; 

    //wire[7:0]   CMD_38H = 8'h38;

    always @*
        case (state)
            IDLE: if(start) nstate = BUSY; else nstate = IDLE;
            BUSY: if(done) nstate = IDLE; else nstate = BUSY;
        endcase 

    always @ (posedge clk or posedge rst)
        if(rst) state <= IDLE;
        else state <= nstate;

    // Drive the Serial Clock (sck) @ clk/2 
    always @ (posedge clk or posedge rst)
        if(rst) 
            sck <= 1'b0;
        else if(done)//(state == IDLE) 
            sck <= 1'b0;
        else if(~ce_n) 
            sck <= ~ sck;
        

    // ce_n logic
    always @ (posedge clk or posedge rst)
        if(rst) 
            ce_n <= 1'b1;
        else if(done)
            ce_n <= 1'b1;
        else if (state == BUSY) 
            ce_n <= 1'b0;
        else 
            ce_n <= 1'b1;

    // The transaction counter
    wire [7:0]  wait_start  = (~qpi ? 8 : 2)                    // The command 
                            + ((qpi | qspi) ? 6 : 24);          // The Address        
    wire [7:0]  data_start  = wait_start + (rd_wr ? wait_states : 0);
    wire [7:0]  data_count  = ((qpi | qspi) ? 2 : 8) * size;    
    wire [7:0]  final_count = short_cmd ? 8 : data_start + data_count;
    
    assign done     = (counter == final_count);

    always @ (posedge clk or posedge rst)
        if(rst) 
            counter <= 8'b0;
        else if(sck & ~done) 
            counter <= counter + 1'b1;
        else if(state == IDLE) 
            counter <= 8'b0;

    // Data Out
    wire [3:0]      dout_spi;
    wire [3:0]      dout_qspi;
    wire [3:0]      dout_qpi;
    
    wire [7:0]      spi_bit_index = (counter < 40)  ?   39 - (counter)  :
                                    (counter < 48)  ?   55 - (counter)  :
                                    (counter < 56)  ?   71 - (counter)  :
                                    (counter < 64)  ?   87 - (counter)  :
                                    0;

    assign dout_spi =   (counter < 8)   ?   cmd[7 - counter]            :
                        (counter < 32)  ?   addr[31 - counter]          : 
                        data_i[spi_bit_index];
                        
                        
    assign dout_qspi=   (counter < 8)   ?   cmd[7 - counter]            :
                        (counter == 8)  ?   addr[23:20]                 : 
                        (counter == 9)  ?   addr[19:16]                 :
                        (counter == 10) ?   addr[15:12]                 :
                        (counter == 11) ?   addr[11:8]                  :
                        (counter == 12) ?   addr[7:4]                   :
                        (counter == 13) ?   addr[3:0]                   :
                        (counter == 14) ?   data_i[7:4]                 :
                        (counter == 15) ?   data_i[3:0]                 :
                        (counter == 16) ?   data_i[15:12]               :
                        (counter == 17) ?   data_i[11:8]                :
                        (counter == 18) ?   data_i[23:20]               :
                        (counter == 19) ?   data_i[19:16]               :
                        (counter == 20) ?   data_i[31:28]               :                   
                        (counter == 21) ?   data_i[27:24]                 :
                        4'b0000;

    assign dout_qpi =   (counter == 0)  ?   cmd[7:4]                    :
                        (counter == 1)  ?   cmd[3:0]                    :
                        (counter == 2)  ?   addr[23:20]                 : 
                        (counter == 3)  ?   addr[19:16]                 :
                        (counter == 4)  ?   addr[15:12]                 :
                        (counter == 5)  ?   addr[11:8]                  :
                        (counter == 6)  ?   addr[7:4]                   :
                        (counter == 7)  ?   addr[3:0]                   :
                        (counter == 8)  ?   data_i[7:4]                 :
                        (counter == 9)  ?   data_i[3:0]                 :
                        (counter == 10) ?   data_i[15:12]               :
                        (counter == 11) ?   data_i[11:8]                :
                        (counter == 12) ?   data_i[23:20]               :
                        (counter == 13) ?   data_i[19:16]               :
                        (counter == 14) ?   data_i[31:28]               :                   
                        (counter == 15) ?   data_i[27:24]                 :
                        4'b0000;
    
    assign  dout    =   qpi     ?   dout_qpi    :
                        qspi    ?   dout_qspi   :
                        dout_spi;
         
    // Data In
    wire [7:0]  byte_index = (counter - data_start) >> ((qpi | qspi) ? 1 : 3);
    always @ (posedge clk)
        if(counter >= data_start && counter <= final_count)
            if(sck) 
                if(qpi | qspi) 
                    data[byte_index] <= {data[byte_index][3:0], din}; 
                else
                    data[byte_index] <= {data[byte_index][6:0], din[1]};  
    assign data_o = {data[3], data[2], data[1], data[0]};

    // Out Enable
    wire [3:0]  douten_qpi;
    wire [3:0]  douten_qspi;
    wire [3:0]  douten_spi;
    wire        has_wait_states = (wait_states != 0) & rd_wr;
    assign douten_spi   =   4'b0001;
    assign douten_qspi  =   (counter < 8)                               ?   4'b0001 :
                            (counter < 14)                              ?   4'b1111 :
                            ((counter < data_start) & has_wait_states)  ?   4'b0000 :
                            (rd_wr)                                     ?   4'b0000 :
                            4'b1111;
    assign douten_qpi   =   (counter < 2)                               ?   4'b1111 :
                            (counter < 8)                               ?   4'b1111 :
                            ((counter < data_start) & has_wait_states)  ?   4'b0000 :
                            (rd_wr)                                     ?   4'b0000 :
                            4'b1111;
                            
    assign  douten      =   qpi     ?   douten_qpi    :
                            qspi    ?   douten_qspi   :
                            douten_spi;

endmodule