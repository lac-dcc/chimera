// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

// `timescale  1ns / 1ps
`timescale  10ns / 10ns
`define INST_COMPUTE 32'd87 
`define INST_WRITE_WEIGHT 32'd12 
`define INST_WRITE_BIAS 32'd34

`define TESTFILEDIR    "F:\\vivado_works\\verilog_code\\git_repo\\university_project\\test_data"

//FIXME:20230815須測試如果沒有給bias的情況，現在都是以有bias前提測試
// `define DEBUG
// `define DEBUG_MEM
module tb_auto_read2_0;

    //setting//
    parameter LAYER_CNT    = 8;


    
    //register size parameter 
    parameter IFMAPS_WIDTH = 256;
    parameter IFMAPS_HIGHT = 256;
    parameter IFMAPS_CH    = 256;
    parameter WEIGHT_WIDTH = 5;
    parameter WEIGHT_HIGHT = 5;
    parameter WEIGHT_NUM   = 256;
    parameter STRIDE       = 1;

    parameter OFMAPS_WIDTH = IFMAPS_WIDTH;
    parameter OFMAPS_HIGHT = IFMAPS_HIGHT;
    
    // top Parameters
    parameter PERIOD                     = 20 ;
    parameter MAC_NUM                    = 256;
    parameter WEITGHT_BRAM_ADDRESS_WIDTH = 12 ;
    parameter BIAS_BRAM_ADDRESS_WIDTH    = 9  ;
    parameter BIAS_BRAM_DATA_WIDTH       = 32 ;
    parameter AXIS_PRELOAD_FIFO_DEPTH    = 4  ;
    parameter AXIS_FIFO_SIZE             = 16 ;
    parameter M_AXIS_FIFO_DEPTH          = 4  ;
    parameter C_S_AXIS_TDATA_WIDTH       = 32 ;
    parameter C_S_AXI_DATA_WIDTH         = 32 ;
    parameter C_S_AXI_ADDR_WIDTH         = 5  ;
    parameter C_M_AXIS_TDATA_WIDTH       = 32 ;

    integer w,z,x,y,i,n,ch,h,idx; //loop variable

    //validattion counter 
    integer ofmaps_validation_cnt=0;
    integer psum_validation_cnt=0;

    //error flag and count 
    //when the error is detected the flag become 1 and stop the simulation 
    integer error_flag=0;
    integer error_cnt=0;

    // top Inputs
    reg   clk                                  = 0 ;
    reg   rst_n                                = 0 ;
    reg   [C_S_AXIS_TDATA_WIDTH-1 : 0]  S_AXIS_TDATA = 0 ;
    reg   [(C_S_AXIS_TDATA_WIDTH/8)-1 : 0]  S_AXIS_TSTRB = 0 ;
    reg   S_AXIS_TLAST                         = 0 ;
    reg   S_AXIS_TVALID                        = 0 ;
    reg   [C_S_AXI_ADDR_WIDTH-1 : 0]  S_AXI_AWADDR = 0 ;
    reg   [2 : 0]  S_AXI_AWPROT                = 0 ;
    reg   S_AXI_AWVALID                        = 0 ;
    reg   [C_S_AXI_DATA_WIDTH-1 : 0]  S_AXI_WDATA = 0 ;
    reg   [(C_S_AXI_DATA_WIDTH/8)-1 : 0]  S_AXI_WSTRB = 0 ;
    reg   S_AXI_WVALID                         = 0 ;
    reg   S_AXI_BREADY                         = 0 ;
    reg   [C_S_AXI_ADDR_WIDTH-1 : 0]  S_AXI_ARADDR = 0 ;
    reg   [2 : 0]  S_AXI_ARPROT                = 0 ;
    reg   S_AXI_ARVALID                        = 0 ;
    reg   S_AXI_RREADY                         = 0 ;
    

    //watch reg for knowing the function is been called
    reg   watch_set_kernel_size=0;
    reg   watch_set_ofmaps_channel_and_input_channel=0;
    reg   watch_set_function_and_ofmaps_width=0;
    reg   watch_compute_start=0;
    reg   watch_write_weight_start=0;
    reg   watch_write_bias_start=0;
    reg   watch_read_AXI=0;
    reg   watch_read_FSM=0;


    // top Outputs
    wire  S_AXIS_TREADY                        ;
    wire  [1279:0]  psum_out                   ;
    wire  S_AXI_AWREADY                        ;
    wire  S_AXI_WREADY                         ;
    wire  [1 : 0]  S_AXI_BRESP                 ;
    wire  S_AXI_BVALID                         ;
    wire  S_AXI_ARREADY                        ;
    wire  [C_S_AXI_DATA_WIDTH-1 : 0]  S_AXI_RDATA ;
    wire  [1 : 0]  S_AXI_RRESP                 ;
    wire  S_AXI_RVALID                         ;

    reg M_AXIS_TREADY = 1 ;

    wire [C_M_AXIS_TDATA_WIDTH-1:0]       M_AXIS_TDATA;
    wire                                  M_AXIS_TVALID;
    wire						          M_AXIS_TLAST;
    wire [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0] M_AXIS_TSTRB ; 

    //memory for validation 
    //in board only need implement ifmaps weight bias memory
    reg [0:0] mem_i [0:IFMAPS_CH-1][0:IFMAPS_HIGHT-1][0:IFMAPS_WIDTH-1];                //ifmaps
    reg [0:0] mem_w [0:WEIGHT_NUM-1][0:IFMAPS_CH-1][0:WEIGHT_HIGHT-1][0:WEIGHT_WIDTH-1];//weight
    reg [15:0] mem_b [0:WEIGHT_NUM-1];                                                  //bias
    reg signed [31:0] mem_pb [0:WEIGHT_NUM-1][0:OFMAPS_HIGHT-1][0:OFMAPS_WIDTH-1];      //psum before bias
    reg signed [31:0] mem_pa [0:WEIGHT_NUM-1][0:OFMAPS_HIGHT-1][0:OFMAPS_WIDTH-1];      //psum after bias
    reg [0:0] mem_o [0:WEIGHT_NUM-1][0:OFMAPS_HIGHT-1][0:OFMAPS_WIDTH-1];               //ofmaps
    reg [OFMAPS_WIDTH*OFMAPS_HIGHT*WEIGHT_NUM+32:0] TDATA_ANS = 0;                      //ANS register from ofmaps
    reg [31:0] TDATA_buf;                                                               //ANS register from AXIS

    //present layer setting from setting.txt 
    integer function_now;
    integer ifmaps_width_now; 
    integer ifmaps_hight_now; 
    integer ifmaps_ch_now; 
    integer weight_width_now; 
    integer weight_hight_now; 
    integer weight_num_now; 
    integer ofmaps_hight_now;
    integer ofmaps_width_now;
    integer stride_now;
    integer layer;

    //file reading variable
    integer status, fd;
    reg [256*8-1:0] file_dir;
    reg [256*8-1:0] comment;

    //psum output from PL
    assign psum_out = u_top.u_data_path.u_psum_adder.o_data;

    initial
    begin
        forever #(PERIOD/2)  clk=~clk;
    end

    //repeat LAYER_CNT times.
    //first, read memory from file then prepare the AXIS_TDATA answer.
    //second, setting PL configuration
    //third, input weight if in convolution
    //fourth, input bias if in convolution
    //fifth, input ifmaps
    //sixth, wait the AXI signal 
    initial
    begin
    for(layer=0;layer<LAYER_CNT;layer=layer+1) begin

        #(PERIOD*2) rst_n  =  1;
        #(PERIOD*5);
        load_mem_from_file(layer+48);
        // read_FSM();//just a test

        ////////////////////////////////////////////////////////

        //setting
        set_kernel_size(weight_width_now);
if(function_now==1) begin
        set_ofmaps_channel_and_input_channel(0,ifmaps_ch_now);
        set_stride_function_ofmaps_width(stride_now,2'd1,ofmaps_width_now);
end
else if (function_now==0) begin
        set_ofmaps_channel_and_input_channel(weight_num_now,ifmaps_ch_now);
        set_stride_function_ofmaps_width(stride_now,2'd0,ofmaps_width_now);
end
        
        //write weight
        #(PERIOD*5);
if(function_now==0) begin
        write_weight_start();
        // read_FSM();//just a test
        // $stop;
        write_weight();

        while(S_AXI_RDATA!=32'd1)begin//wait ack
            read_AXI(3);
        end
        $display("write weight success");

        read_FSM();

        //write bias
        #(PERIOD*5);
        write_bias_start();
        write_bias();

        while(S_AXI_RDATA!=32'd2)begin//wait ack
            read_AXI(3);
        end
        $display("write bias success");

        read_FSM();
        #(PERIOD*2);

end
        #(PERIOD*5);
        compute_start();
        #(PERIOD*2);

        //wtite ifmaps 
        @(posedge clk);
        write_ifmaps();
        while(S_AXI_RDATA!=32'hFFFFFFFF)begin//wait ack
            read_AXI(3);
            #(PERIOD*100);
        end
        read_FSM();

        if(error_flag == 0) begin
            $display("/////////////////////////////////////////////////////////////////////////////////");
            $display("//                                                                             //");
            $display("//                       congratulation you pass (%2d/%2d) layer                 //",layer,LAYER_CNT-1);
            $display("//                                                                             //");
            $display("/////////////////////////////////////////////////////////////////////////////////");
        end
        else begin
            $display("/////////////////////////////////////////////////////////////////////////////////");
            $display("//                                                                             //");
            $display("//           you fail the pattern there are %d error in your design            //",error_cnt);
            $display("//                                                                             //");
            $display("/////////////////////////////////////////////////////////////////////////////////");
        end
        #(PERIOD*1000);
    end

        #10000;
        $finish;
    end

    //compare the answer from AXIS for convolution 
    integer validate_cnt=0;
    always @(posedge clk) begin
        if(function_now==0) begin
            if(u_top.M_AXIS_TVALID) begin
`ifdef DEBUG
                $display("time=%7d  M_AXIS_TDATA = %h = %b, M_AXIS_TVALID = %d , M_AXIS_TLAST = %h",$time,u_top.M_AXIS_TDATA,u_top.M_AXIS_TDATA,u_top.M_AXIS_TVALID,u_top.M_AXIS_TLAST);
`endif
                // for(i=0;i<32;i=i+1) begin
                //     if(ofmaps_validation_cnt < ofmaps_hight_now*ofmaps_width_now*weight_num_now) begin
                //         if(u_top.M_AXIS_TDATA[i] != mem_o[ofmaps_validation_cnt%weight_num_now][ofmaps_validation_cnt/(weight_num_now*ofmaps_width_now)][(ofmaps_validation_cnt/weight_num_now)%ofmaps_width_now]) begin
                //             $display("time=%7d  out:M_AXIS_TDATA[%d] = %b , expect: %b",$time,i,u_top.M_AXIS_TDATA[i],mem_o[ofmaps_validation_cnt%weight_num_now][ofmaps_validation_cnt/(weight_num_now*ofmaps_width_now)][(ofmaps_validation_cnt/weight_num_now)%ofmaps_width_now]);   
                //             error_flag = 1;
                //             error_cnt = error_cnt+1;

                //             // #1000
                //             // $stop;
                //         end
                //     end
                //     ofmaps_validation_cnt=ofmaps_validation_cnt+1;
                // end
                if(u_top.M_AXIS_TDATA != TDATA_ANS[validate_cnt*32 +: 32]) begin
                    $display("time=%7d  out:M_AXIS_TDATA = %d(d) = %h(h) = %b , expect: %h(h)",$time,u_top.M_AXIS_TDATA,u_top.M_AXIS_TDATA,u_top.M_AXIS_TDATA,TDATA_ANS[validate_cnt*32 +: 32]);   
                    error_flag = 1;
                    error_cnt = error_cnt+1;

                    // #1000
                    // $stop;
                end
                validate_cnt = validate_cnt+1;
            end
        end
    end

    //compare the answer from AXIS for pooling
    always @(posedge clk) begin
        if(function_now==1) begin
            if(u_top.M_AXIS_TVALID) begin
`ifdef DEBUG
                $display("time=%7d  M_AXIS_TDATA = %h = %b, M_AXIS_TVALID = %d , M_AXIS_TLAST = %h",$time,u_top.M_AXIS_TDATA,u_top.M_AXIS_TDATA,u_top.M_AXIS_TVALID,u_top.M_AXIS_TLAST);
`endif
                for(i=0;i<32;i=i+1) begin
                    if(u_top.M_AXIS_TDATA[i] != TDATA_ANS[ofmaps_validation_cnt]) begin
                        $display("time=%7d  out:M_AXIS_TDATA[%d] = %b , expect: %b , at ofmaps[%d][%d][%d]",$time,i,u_top.M_AXIS_TDATA[i],TDATA_ANS[ofmaps_validation_cnt],ofmaps_validation_cnt%ifmaps_ch_now,ofmaps_validation_cnt/(ifmaps_ch_now*ofmaps_width_now),ofmaps_validation_cnt/(ifmaps_ch_now)%ofmaps_width_now);   
                        error_flag = 1;
                        error_cnt = error_cnt+1;

                        #1000
                        $stop;
                    end
                    ofmaps_validation_cnt=ofmaps_validation_cnt+1;
                end
            end
        end
    end

    //write the progress
    reg yis0_pos_buf=0;
    reg xis0_pos_buf=0;
    always @(posedge clk) begin
        yis0_pos_buf<=(y==0);
        xis0_pos_buf<=(x==0);
    end
    always @(posedge clk) begin
        if((y==0 && !yis0_pos_buf) || (x==0 && !xis0_pos_buf)) begin
            if(error_flag==0) begin
                $display("time=%7d  ifmaps row(%d/%d) ifmaps col(%d/%d) success",$time,x,ifmaps_hight_now-weight_hight_now,y,ifmaps_width_now-weight_width_now);   
            end
            else begin
                $display("***************************************************************************");   
                $display("time=%7d  ifmaps row(%d/%d) ifmaps col(%d/%d) error",$time,x,ifmaps_hight_now-weight_hight_now,y,ifmaps_width_now-weight_width_now);   
                $display("***************************************************************************");   
            end
        end
    end

    top #(
        .MAC_NUM                    (MAC_NUM                    ),
        .WEITGHT_BRAM_ADDRESS_WIDTH (WEITGHT_BRAM_ADDRESS_WIDTH ),
        .BIAS_BRAM_ADDRESS_WIDTH    (BIAS_BRAM_ADDRESS_WIDTH    ),
        .BIAS_BRAM_DATA_WIDTH       (BIAS_BRAM_DATA_WIDTH       ),
        .AXIS_PRELOAD_FIFO_DEPTH    (AXIS_PRELOAD_FIFO_DEPTH    ),
        .AXIS_FIFO_SIZE             (AXIS_FIFO_SIZE             ),
        .M_AXIS_FIFO_DEPTH          (M_AXIS_FIFO_DEPTH          ),
        .C_S_AXIS_TDATA_WIDTH       (C_S_AXIS_TDATA_WIDTH       ),
        .C_S_AXI_DATA_WIDTH         (C_S_AXI_DATA_WIDTH         ),
        .C_S_AXI_ADDR_WIDTH         (C_S_AXI_ADDR_WIDTH         ),
        .C_M_AXIS_TDATA_WIDTH       (C_M_AXIS_TDATA_WIDTH       ))
    u_top (
        //golbal
        .clk               ( clk                                             ),
        .rst_n             ( rst_n                                           ),

        //AXIS
        .S_AXIS_TDATA      ( S_AXIS_TDATA   [C_S_AXIS_TDATA_WIDTH-1 : 0]     ),
        .S_AXIS_TSTRB      ( S_AXIS_TSTRB   [(C_S_AXIS_TDATA_WIDTH/8)-1 : 0] ),
        .S_AXIS_TLAST      ( S_AXIS_TLAST                                    ),
        .S_AXIS_TVALID     ( S_AXIS_TVALID                                   ),
        .S_AXIS_TREADY     ( S_AXIS_TREADY                                   ),

        //AXI   
            //AW
        .S_AXI_AWADDR      ( S_AXI_AWADDR   [C_S_AXI_ADDR_WIDTH-1 : 0]       ),
        .S_AXI_AWPROT      ( S_AXI_AWPROT   [2 : 0]                          ),
        .S_AXI_AWVALID     ( S_AXI_AWVALID                                   ),
        .S_AXI_AWREADY     ( S_AXI_AWREADY                                   ),
            //W
        .S_AXI_WREADY      ( S_AXI_WREADY                                    ),
        .S_AXI_WDATA       ( S_AXI_WDATA    [C_S_AXI_DATA_WIDTH-1 : 0]       ),
        .S_AXI_WSTRB       ( S_AXI_WSTRB    [(C_S_AXI_DATA_WIDTH/8)-1 : 0]   ),
        .S_AXI_WVALID      ( S_AXI_WVALID                                    ),
            //B
        .S_AXI_BREADY      ( S_AXI_BREADY                                    ),
        .S_AXI_BRESP       ( S_AXI_BRESP    [1 : 0]                          ),
        .S_AXI_BVALID      ( S_AXI_BVALID                                    ),
            //AR
        .S_AXI_ARREADY     ( S_AXI_ARREADY                                   ),
        .S_AXI_ARADDR      ( S_AXI_ARADDR   [C_S_AXI_ADDR_WIDTH-1 : 0]       ),
        .S_AXI_ARPROT      ( S_AXI_ARPROT   [2 : 0]                          ),
        .S_AXI_ARVALID     ( S_AXI_ARVALID                                   ),
            //R
        .S_AXI_RREADY      ( S_AXI_RREADY                                    ),
        .S_AXI_RDATA       ( S_AXI_RDATA    [C_S_AXI_DATA_WIDTH-1 : 0]       ),
        .S_AXI_RRESP       ( S_AXI_RRESP    [1 : 0]                          ),
        .S_AXI_RVALID      ( S_AXI_RVALID                                    ),

        //tmp_out
        .M_AXIS_TREADY     ( M_AXIS_TREADY                                   ),

        .M_AXIS_TDATA      ( M_AXIS_TDATA    [C_M_AXIS_TDATA_WIDTH-1:0]      ),
        .M_AXIS_TVALID     ( M_AXIS_TVALID                                   ),
        .M_AXIS_TLAST      ( M_AXIS_TLAST                                    ),
        .M_AXIS_TSTRB      ( M_AXIS_TSTRB    [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0])
    );


    task set_kernel_size(input [2:0]kernel_size);begin
        watch_set_kernel_size=1;

        S_AXI_BREADY=1'b1;
        S_AXI_AWADDR=4'b1000;
        S_AXI_AWPROT=3'b000;
        S_AXI_WSTRB=4'b1111;
        case(kernel_size) 
            3'd1:S_AXI_WDATA[4:0]=5'b00001;
            3'd2:S_AXI_WDATA[4:0]=5'b00010;
            3'd3:S_AXI_WDATA[4:0]=5'b00100;
            3'd4:S_AXI_WDATA[4:0]=5'b01000;
            3'd5:S_AXI_WDATA[4:0]=5'b10000;
            default :S_AXI_WDATA[4:0]=5'b10000;                
        endcase

        S_AXI_AWVALID=1'b1;
        S_AXI_WVALID=1'b1;

        wait(S_AXI_AWREADY==1'b1 && S_AXI_WREADY==1'b1) begin
            wait(S_AXI_BVALID) begin
                S_AXI_AWVALID=1'b0;
                S_AXI_WVALID=1'b0;
                watch_set_kernel_size=0;
            end
            $display("time=%7d  set_kernel_size success",$time);
        end
    end
    endtask

    task read_AXI(input [2:0] addr);begin
        @(posedge clk);
        watch_read_AXI=1;

        S_AXI_ARADDR={addr,2'd0};
        S_AXI_ARPROT=3'b000;
        S_AXI_ARVALID=1'b1;
        S_AXI_RREADY=1'd0;

        wait(S_AXI_ARREADY==1'b1) begin
            wait(S_AXI_RVALID) begin
                $display($time,,"read AXI[%d] = %d = %h = %b ",addr,S_AXI_RDATA,S_AXI_RDATA,S_AXI_RDATA);

                S_AXI_ARVALID=1'b0;
                S_AXI_RREADY=1'b1;
                watch_read_AXI=0;
                #(PERIOD*2)
                S_AXI_RREADY=1'b0;

            end            
        end
    end
    endtask
    task read_FSM();begin
        @(posedge clk);
        watch_read_FSM=1;

        S_AXI_ARADDR={3'd4,2'd0};
        S_AXI_ARPROT=3'b000;
        S_AXI_ARVALID=1'b1;
        S_AXI_RREADY=1'd0;

        wait(S_AXI_ARREADY==1'b1) begin
            wait(S_AXI_RVALID) begin
                $display("control_load_weight_state = %d\n",S_AXI_RDATA[4:0],
                          "control_load_ifmaps_state = %d\n",S_AXI_RDATA[9:5],
                          "control_write_weight_state = %d\n",S_AXI_RDATA[12:10],
                          "control_write_bias_state = %d\n",S_AXI_RDATA[15:13],
                          "control_load_bias_state = %d\n",S_AXI_RDATA[18:16],
                          "weight_bram_read_state = %d\n",S_AXI_RDATA[20:19],
                          "weight_bram_write_state = %d\n",S_AXI_RDATA[23:21],
                          "bias_bram_read_state = %d\n",S_AXI_RDATA[25:24],
                          "bias_bram_write_state = %d\n",S_AXI_RDATA[28:26]);

                S_AXI_ARVALID=1'b0;
                S_AXI_RREADY=1'b1;
                watch_read_FSM=0;
                #(PERIOD*2)
                S_AXI_RREADY=1'b0;

            end            
        end
        
    end
    endtask

    task write_weight_start();begin
        watch_write_weight_start=1;

        S_AXI_BREADY=1'b1;
        S_AXI_AWADDR=4'b0000;
        S_AXI_AWPROT=3'b000;
        S_AXI_WSTRB=4'b0001;
        S_AXI_WDATA=`INST_WRITE_WEIGHT;

        S_AXI_AWVALID=1'b1;
        S_AXI_WVALID=1'b1;

        wait(S_AXI_AWREADY==1'b1 && S_AXI_WREADY==1'b1) begin
            wait(S_AXI_BVALID) begin
                S_AXI_AWVALID=1'b0;
                S_AXI_WVALID=1'b0;
            end
            $display("time=%7d  write_weight_start success",$time);
            watch_write_weight_start=0;
        end
    end
    endtask

    task write_bias_start();begin
        watch_write_bias_start=1;

        S_AXI_BREADY=1'b1;
        S_AXI_AWADDR=4'b0000;
        S_AXI_AWPROT=3'b000;
        S_AXI_WSTRB=4'b0001;
        S_AXI_WDATA=`INST_WRITE_BIAS;

        S_AXI_AWVALID=1'b1;
        S_AXI_WVALID=1'b1;

        wait(S_AXI_AWREADY==1'b1 && S_AXI_WREADY==1'b1) begin
            wait(S_AXI_BVALID) begin
                S_AXI_AWVALID=1'b0;
                S_AXI_WVALID=1'b0;
            end
            $display("time=%7d  write_bias_start success",$time);
            watch_write_bias_start=0;
        end
    end
    endtask 

    task compute_start();begin
        watch_compute_start=1;

        S_AXI_BREADY=1'b1;
        S_AXI_AWADDR=4'b0000;
        S_AXI_AWPROT=3'b000;
        S_AXI_WSTRB=4'b0001;
        S_AXI_WDATA=`INST_COMPUTE;

        S_AXI_AWVALID=1'b1;
        S_AXI_WVALID=1'b1;

        wait(S_AXI_AWREADY==1'b1 && S_AXI_WREADY==1'b1) begin
            wait(S_AXI_BVALID) begin
                S_AXI_AWVALID=1'b0;
                S_AXI_WVALID=1'b0;
            end
            $display("time=%7d  compute_start success",$time);
            watch_compute_start=0;
        end
    end
    endtask 

    task set_ofmaps_channel_and_input_channel(input [11:0]ofmaps_channel,input [11:0] input_channel);begin
        watch_set_ofmaps_channel_and_input_channel=1;

        S_AXI_AWADDR=4'b0000;
        S_AXI_AWPROT=3'b000;
        S_AXI_WSTRB=4'b1110;
        S_AXI_WDATA={ofmaps_channel,input_channel,8'd0};
        S_AXI_BREADY=1'b1;
            
        S_AXI_AWVALID=1'b1;
        S_AXI_WVALID=1'b1;

        wait(S_AXI_AWREADY==1'b1 && S_AXI_WREADY==1'b1) begin
            
            wait(S_AXI_BVALID) begin
                S_AXI_AWVALID=1'b0;
                S_AXI_WVALID=1'b0;
            end
            $display("time=%7d  set_ofmaps_channel_and_input_channel success",$time);
            watch_set_ofmaps_channel_and_input_channel=0;

        end
    end
    endtask

    task set_stride_function_ofmaps_width(input [2:0] stride,input [1:0] func,input [8:0]ofmaps_width);begin
        watch_set_function_and_ofmaps_width=1;
        
        //0 CONV 1 POOL
        //[1:0] function
        //[10:2] ofmaps_width
        //[13:11]stride
        S_AXI_AWADDR=4'b0100;
        S_AXI_AWPROT=3'b000;
        S_AXI_WSTRB=4'b1111;
            
        S_AXI_WDATA={18'd0,stride,ofmaps_width,func};
        S_AXI_BREADY=1'b1;

        S_AXI_AWVALID=1'b1;
        S_AXI_WVALID=1'b1;

        wait(S_AXI_AWREADY==1'b1 && S_AXI_WREADY==1'b1) begin
            
            wait(S_AXI_BVALID) begin
                S_AXI_AWVALID=1'b0;
                S_AXI_WVALID=1'b0;
            end
            $display("time=%7d  set_stride_function_ofmaps_width success",$time);
            watch_set_function_and_ofmaps_width=0;
        end
    end
    endtask

    task axis_in(input [31:0]data);begin
        S_AXIS_TVALID=1;
        S_AXIS_TDATA=data;
        S_AXIS_TSTRB=0;
        S_AXIS_TLAST=0;
        
        @(posedge clk);
        while(~S_AXIS_TREADY) begin
            @(posedge clk);
        end

        S_AXIS_TVALID=0;
    end
    endtask

    task error_axis_input(input integer in_delay, input integer out_delay);begin
        #(in_delay);
        axis_in(32'b1111111111);
        axis_in(32'b1000000111);
        axis_in(32'b1110000001);
        axis_in(32'b1110001000);
        axis_in(32'b0101100001);
        axis_in(32'b1110001000);
        axis_in(32'b0101100001);
        axis_in(32'b1110001000);
        axis_in(32'b0101100001);
        axis_in(32'b1110001000);
        axis_in(32'b0101100001);
        axis_in(32'b1000000111);
        #(out_delay);
    end
    endtask

    integer f_ret;
    integer tdata_ans_tmp;
    integer tdata_ans_tmp_idx;
    task load_mem_from_file(input [7:0] layer);begin
        update_setting(layer); 

        //this if is for sigal layer without file index  
        if(layer == "") begin
            $readmemb($sformatf("%s/ifmaps.txt",`TESTFILEDIR),mem_i);
            if(function_now == 0) begin
                $readmemb($sformatf("%s/weight.txt",`TESTFILEDIR),mem_w);
                $readmemh($sformatf("%s/bias.txt",`TESTFILEDIR),mem_b);
                $readmemh($sformatf("%s/psum_before_bias.txt",`TESTFILEDIR),mem_pb);
                $readmemh($sformatf("%s/psum_after_bias.txt",`TESTFILEDIR),mem_pa);
            end 
            $readmemb($sformatf("%s/ofmaps.txt",`TESTFILEDIR),mem_o);
        end
        else begin
            read_mem_i(layer);
            if(function_now==0) begin
                read_mem_w(layer);
                read_mem_b(layer);
                read_mem_pb(layer);
                read_mem_pa(layer);
            end
            read_mem_o(layer);
        end


        //build the answer table
        if(function_now==0) begin
            $write("M_AXIS_ANS:\n");

            f_ret = $fopen({`TESTFILEDIR,"\\AXIS_ANS",layer,".txt"},"w");

            // for(ofmaps_validation_cnt = 0 ; ofmaps_validation_cnt < ofmaps_hight_now*ofmaps_width_now*weight_num_now;ofmaps_validation_cnt=ofmaps_validation_cnt+1) begin
            //     TDATA_ANS[ofmaps_validation_cnt] = mem_o[ofmaps_validation_cnt%weight_num_now][ofmaps_validation_cnt/(weight_num_now*ofmaps_width_now)][(ofmaps_validation_cnt/weight_num_now)%ofmaps_width_now];
            // end
            // ofmaps_validation_cnt = 0 ;
            // for(x=0;(x * 32) < ofmaps_hight_now*ofmaps_width_now*weight_num_now;x=x+1) begin

            //     $write("%h\n",TDATA_ANS[x*32 +: 32]);
            //     $fwrite(f_ret,"%h\n",TDATA_ANS[x*32 +: 32]);
            // end
            ofmaps_validation_cnt = 0 ;
            validate_cnt = 0;
            for(y=0;y<ofmaps_hight_now;y=y+1) begin
                for(x=0;x<ofmaps_width_now;x=x+1) begin
                    tdata_ans_tmp = 0;
                    tdata_ans_tmp_idx = 0;
                    for(ch = 0;ch<weight_num_now;ch=ch+1) begin
                        tdata_ans_tmp = tdata_ans_tmp | (mem_o[ch][y][x] << tdata_ans_tmp_idx);
                        tdata_ans_tmp_idx = tdata_ans_tmp_idx + 1;

                        if((ch % 32 == 31) || (ch == weight_num_now-1)) begin
                            TDATA_ANS[ofmaps_validation_cnt*32 +: 32] = tdata_ans_tmp;
                            ofmaps_validation_cnt = ofmaps_validation_cnt + 1;
                            tdata_ans_tmp = 0;
                            tdata_ans_tmp_idx = 0;
                        end
                    end
                end
            end
            for(x=0;x < ofmaps_validation_cnt;x=x+1) begin
                $write("%h\n",TDATA_ANS[x*32 +: 32]);
                $fwrite(f_ret,"%h\n",TDATA_ANS[x*32 +: 32]);
            end

            $display("load test data finish");
            $fclose(f_ret);
        end
        else if(function_now==1) begin

            $write("M_AXIS_ANS:\n");
            f_ret = $fopen({`TESTFILEDIR,"\\AXIS_ANS",layer,".txt"},"w");
            ofmaps_validation_cnt=0;
            for(y=0;y<ofmaps_hight_now*ofmaps_width_now;y=y+1) begin
                for(x=0;x<((ifmaps_ch_now+31)/32)*32;x=x+1) begin
                    if(x>=ifmaps_ch_now) begin
                        TDATA_buf[x%32] = 0;
                    end
                    else begin
                        TDATA_buf[x%32] = mem_o[ofmaps_validation_cnt%ifmaps_ch_now][ofmaps_validation_cnt/(ifmaps_ch_now*ofmaps_width_now)][(ofmaps_validation_cnt/ifmaps_ch_now)%ofmaps_width_now];
                        ofmaps_validation_cnt=ofmaps_validation_cnt+1;
                    end

                    if(x%32 == 31)begin
                        TDATA_ANS[(y*((ifmaps_ch_now+31)/32)+(x/32))*32 +: 32] = TDATA_buf;

                        $write("%h\n",TDATA_buf);
                        $fwrite(f_ret,"%h\n",TDATA_ANS[x*32 +: 32]);
                    end
                end
            end
            ofmaps_validation_cnt=0;
            $display("load test data finish");
            $fclose(f_ret);

        end
    

    end
    endtask

    reg[31:0] write_weight_reg;

    integer height;
    task write_weight(); begin
        $display("write weight start");
        for(x=0;x<weight_num_now;x=x+1) begin
            wait(!clk);
            for(y=0;y<weight_width_now;y=y+1) begin
                for(height=0;height<weight_hight_now;height=height+1) begin
                    write_weight_reg=0;
                    idx=0;
                    for(z=0;z<ifmaps_ch_now;z=z+1) begin
                        write_weight_reg = write_weight_reg | (mem_w[x][z][height][y] << idx);
                        idx=idx+1;
                        if((z % 32 ==31) || (z == ifmaps_ch_now-1)) begin
`ifdef DEBUG
                            $display("number %3d weight = %h(h) = %d(d) = %b",x,write_weight_reg,write_weight_reg,write_weight_reg);
`endif
                            axis_in(write_weight_reg);
                            write_weight_reg = 0;
                            idx = 0;
                        end

                    end
                end

            end
`ifdef DEBUG
            $display("\n");
`endif
        end

    end
    endtask

    reg[31:0] write_bias_reg;
    task write_bias(); begin
        $display("write bias start");
        for(x=0;x<weight_num_now;x=x+1) begin
            wait(!clk);
            write_bias_reg[31:16]=16'd0;
            write_bias_reg[15:0]=mem_b[x];
            axis_in(write_bias_reg);
    `ifdef DEBUG
            $display("number %3d bias = %h",x,write_bias_reg);
    `endif
        end
    end
    endtask


    reg[31:0] write_ifmaps_reg;
    task write_ifmaps(); begin
        //for pooling
        if(function_now==1) begin
            $display("write ifmaps start");
            for(x=0;x<ifmaps_hight_now;x=x+stride_now) begin
                for(y=0;y<ifmaps_width_now;y=y+1) begin
                    write_ifmaps_reg = 0;
                    idx=0;
                    for(height=0;height<weight_hight_now;height=height+1) begin
                        for(ch=0;ch<ifmaps_ch_now;ch=ch+1) begin
                            write_ifmaps_reg = write_ifmaps_reg | (mem_i[ch][height+x][y]<<idx);
                            idx=idx+1;
                            if((ch % 32 ==31) || (ch == ifmaps_ch_now-1)) begin
`ifdef DEBUG
                                $display("x = %3d y = %3d,input = %d(d) = %h(h) = %b",x,y,write_ifmaps_reg,write_ifmaps_reg,write_ifmaps_reg);
`endif
                                axis_in(write_ifmaps_reg);
                                write_ifmaps_reg = 0;
                                idx = 0;
                            end
                        end
                    end
                end
`ifdef DEBUG
                $display("\n");
`endif
            end 
            $display("write ifmaps finish");
        end
        //for convolution
        else if(function_now==0) begin
            $display("write ifmaps start");
            for(x=0;x<ofmaps_hight_now;x=x+stride_now) begin
                for(y=0;y<ifmaps_width_now;y=y+1) begin
                    write_ifmaps_reg = 0;
                    idx=0;
                    for(height=0;height<weight_hight_now;height=height+1) begin
                        for(ch=0;ch<ifmaps_ch_now;ch=ch+1) begin
                            write_ifmaps_reg = write_ifmaps_reg | (mem_i[ch][height+x][y]<<idx);
                            idx=idx+1;
                            if((ch % 32 ==31) || (ch == ifmaps_ch_now-1)) begin
`ifdef DEBUG
                        $display("x = %3d y = %3d,input = %d(d) = %h(h) = %b",x,y,write_ifmaps_reg,write_ifmaps_reg,write_ifmaps_reg);
`endif
                                axis_in(write_ifmaps_reg);
                                write_ifmaps_reg = 0;
                                idx = 0;
                            end
                        end
                    end
                end
`ifdef DEBUG
                $display("\n");
`endif
            end

            $display("write ifmaps finish");

        end


    end
    endtask
    
    task update_setting(input [7:0] layer); begin
        file_dir = {`TESTFILEDIR,"\\setting",layer,".txt"};
        fd = $fopen(file_dir, "r");

        if (!fd) $error("could not read file");
        status = $fscanf(fd,"%s\n%d",comment,function_now);
        $display("function=%d",function_now);
        status = $fscanf(fd,"%s\n%d",comment,ifmaps_width_now);
        $display("ifmaps_width_now=%d",ifmaps_width_now);
        status = $fscanf(fd,"%s\n%d",comment,ifmaps_hight_now);
        $display("ifmaps_hight_now=%d",ifmaps_hight_now);
        status = $fscanf(fd,"%s\n%d",comment,ifmaps_ch_now);
        $display("ifmaps_ch_now=%d",ifmaps_ch_now);
        status = $fscanf(fd,"%s\n%d",comment,weight_width_now);
        $display("weight_width_now=%d",weight_width_now);
        status = $fscanf(fd,"%s\n%d",comment,weight_hight_now);
        $display("weight_hight_now=%d",weight_hight_now);
        status = $fscanf(fd,"%s\n%d",comment,weight_num_now);
        $display("weight_num_now=%d",weight_num_now);
        status = $fscanf(fd,"%s\n%d",comment,stride_now);
        $display("stride_now=%d",stride_now);

        if(function_now==0) begin
            ofmaps_hight_now = ((ifmaps_width_now - weight_width_now) / stride_now + 1);
            ofmaps_width_now = ((ifmaps_hight_now - weight_hight_now) / stride_now + 1);
        end
        else begin
            ofmaps_hight_now = ((ifmaps_width_now) / weight_width_now);
            ofmaps_width_now = ((ifmaps_hight_now) / weight_hight_now);
        end

    end
    endtask

    task read_mem_i(input [7:0] layer); begin
        file_dir = {`TESTFILEDIR,"\\ifmaps",layer,".txt"};
        fd = $fopen(file_dir, "r");

        if (!fd) $error("could not read file");
        for(ch=0;ch<ifmaps_ch_now;ch=ch+1) begin
            for(h=0;h<ifmaps_hight_now;h=h+1) begin
                for(w=0;w<ifmaps_width_now;w=w+1) begin
                    status = $fscanf(fd,"%b",mem_i[ch][h][w]);
                end
            end
        end

`ifdef DEBUG_MEM
        $write("ifmaps:\n");
        for(ch=0;ch<ifmaps_ch_now;ch=ch+1) begin
            for(h=0;h<ifmaps_hight_now;h=h+1) begin
                for(w=0;w<ifmaps_width_now;w=w+1) begin
                    $write("%h ",mem_i[ch][h][w]);
                end
                $write("\n");
            end
            $write("\n");
        end
`endif 
    end
    endtask

    task read_mem_w(input [7:0] layer); begin
        file_dir = {`TESTFILEDIR,"\\weight",layer,".txt"};
        fd = $fopen(file_dir, "r");

        if (!fd) $error("could not read file");
        for(n=0;n<weight_num_now;n=n+1) begin
            for(ch=0;ch<ifmaps_ch_now;ch=ch+1) begin
                for(h=0;h<weight_hight_now;h=h+1) begin
                    for(w=0;w<weight_width_now;w=w+1) begin
                        status = $fscanf(fd,"%b",mem_w[n][ch][h][w]);
                    end
                end
            end
        end

`ifdef DEBUG_MEM
        for(n=0;n<weight_num_now;n=n+1) begin
            $write("weight %3d :\n",n);
            for(ch=0;ch<ifmaps_ch_now;ch=ch+1) begin
                for(h=0;h<weight_hight_now;h=h+1) begin
                    for(w=0;w<weight_width_now;w=w+1) begin
                        $write("%h ",mem_w[n][ch][h][w]);
                    end
                    $write("\n");
                end
                $write("\n");
            end
            $write("\n");
        end
`endif 
        
    end
    endtask

    task read_mem_b(input [7:0] layer); begin
        file_dir = {`TESTFILEDIR,"\\bias",layer,".txt"};
        fd = $fopen(file_dir, "r");

        if (!fd) $error("could not read file");
        for(n=0;n<weight_num_now;n=n+1) begin
            status = $fscanf(fd,"%h",mem_b[n]);     
        end
        
`ifdef DEBUG_MEM
        $write("bias:\n");
        for(n=0;n<weight_num_now;n=n+1) begin
            $write("%h ",mem_b[n]);
        end
        $write("\n");
`endif 
        
    end
    endtask

    task read_mem_pb(input [7:0] layer); begin
        file_dir = {`TESTFILEDIR,"\\psum_before_bias",layer,".txt"};
        fd = $fopen(file_dir, "r");

        if (!fd) $error("could not read file");
        for(ch=0;ch<weight_num_now;ch=ch+1) begin
            for(h=0;h<ofmaps_hight_now;h=h+1) begin
                for(w=0;w<ofmaps_width_now;w=w+1) begin
                    status = $fscanf(fd,"%d",mem_pb[ch][h][w]);
                end
            end
        end

`ifdef DEBUG_MEM
        $write("psum_before_bias:\n");
        for(ch=0;ch<weight_num_now;ch=ch+1) begin
            for(h=0;h<ofmaps_hight_now;h=h+1) begin
                for(w=0;w<ofmaps_width_now;w=w+1) begin
                    $write("%d ",mem_pb[ch][h][w]);
                end
                $write("\n");
            end
            $write("\n");
        end
`endif 
    end
    endtask

    task read_mem_pa(input [7:0] layer); begin
        file_dir = {`TESTFILEDIR,"\\psum_after_bias",layer,".txt"};
        fd = $fopen(file_dir, "r");

        if (!fd) $error("could not read file");
        for(ch=0;ch<weight_num_now;ch=ch+1) begin
            for(h=0;h<ofmaps_hight_now;h=h+1) begin
                for(w=0;w<ofmaps_width_now;w=w+1) begin
                    status = $fscanf(fd,"%d",mem_pa[ch][h][w]);
                end
            end
        end

`ifdef DEBUG_MEM
        $write("psum_after_bias:\n");
        for(ch=0;ch<weight_num_now;ch=ch+1) begin
            for(h=0;h<ofmaps_hight_now;h=h+1) begin
                for(w=0;w<ofmaps_width_now;w=w+1) begin
                    $write("%d ",mem_pa[ch][h][w]);
                end
                $write("\n");
            end
            $write("\n");
        end
`endif 
    end
    endtask

    task read_mem_o(input [7:0] layer); begin
        file_dir = {`TESTFILEDIR,"\\ofmaps",layer,".txt"};
        fd = $fopen(file_dir, "r");

        if (!fd) $error("could not read file");
        for(ch=0;ch<weight_num_now;ch=ch+1) begin
            for(h=0;h<ofmaps_hight_now;h=h+1) begin
                for(w=0;w<ofmaps_width_now;w=w+1) begin
                    status = $fscanf(fd,"%b",mem_o[ch][h][w]);
                end
            end
        end

`ifdef DEBUG_MEM
        $write("ofmaps:\n");
        for(ch=0;ch<weight_num_now;ch=ch+1) begin
            for(h=0;h<ofmaps_hight_now;h=h+1) begin
                for(w=0;w<ofmaps_width_now;w=w+1) begin
                    $write("%h ",mem_o[ch][h][w]);
                end
                $write("\n");
            end
            $write("\n");
        end
`endif 
    end
    endtask
endmodule