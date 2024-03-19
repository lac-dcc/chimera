module LMC #(parameter pipe_width_gen1 = 8,
parameter pipe_width_gen2 = 16,
parameter pipe_width_gen3 = 16,
parameter pipe_width_gen4 = 32,
parameter pipe_width_gen5 = 32,
parameter number_of_lanes= 4
) (reset_n, pclk, generation, data_valid, data, d_k_in, MUXSyncHeader, PIPEWIDTH, data_valid_out_1, data_valid_out_2, data_valid_out_3, data_valid_out_4, data_valid_out_5, data_valid_out_6, data_valid_out_7, data_valid_out_8, data_valid_out_9, data_valid_out_10, data_valid_out_11, data_valid_out_12, data_valid_out_13, data_valid_out_14, data_valid_out_15, data_valid_out_16, d_k_out_1, d_k_out_2, d_k_out_3, d_k_out_4, d_k_out_5, d_k_out_6, d_k_out_7, d_k_out_8, d_k_out_9, d_k_out_10, d_k_out_11, d_k_out_12, d_k_out_13, d_k_out_14, d_k_out_15, d_k_out_16, dataout_1, dataout_2, dataout_3, dataout_4, dataout_5, dataout_6, dataout_7, dataout_8, dataout_9, dataout_10, dataout_11, dataout_12, dataout_13, dataout_14, dataout_15, dataout_16, LMCSyncHeader_1, LMCSyncHeader_2, LMCSyncHeader_3, LMCSyncHeader_4, LMCSyncHeader_5, LMCSyncHeader_6, LMCSyncHeader_7, LMCSyncHeader_8, LMCSyncHeader_9, LMCSyncHeader_10, LMCSyncHeader_11, LMCSyncHeader_12, LMCSyncHeader_13, LMCSyncHeader_14, LMCSyncHeader_15, LMCSyncHeader_16);



input reset_n, pclk;
input [2:0] generation;
input [63:0] data_valid;
input [511 : 0] data;
input [63:0] d_k_in;
input MUXSyncHeader;

output reg data_valid_out_1, data_valid_out_2, data_valid_out_3, data_valid_out_4, data_valid_out_5, data_valid_out_6, data_valid_out_7, data_valid_out_8, data_valid_out_9, data_valid_out_10, data_valid_out_11, data_valid_out_12, data_valid_out_13, data_valid_out_14, data_valid_out_15, data_valid_out_16;
output reg [31 : 0] dataout_1, dataout_2, dataout_3, dataout_4, dataout_5, dataout_6, dataout_7, dataout_8, dataout_9, dataout_10, dataout_11, dataout_12, dataout_13, dataout_14, dataout_15, dataout_16;
output reg [3 : 0] d_k_out_1, d_k_out_2, d_k_out_3, d_k_out_4, d_k_out_5, d_k_out_6, d_k_out_7, d_k_out_8, d_k_out_9, d_k_out_10, d_k_out_11, d_k_out_12, d_k_out_13, d_k_out_14, d_k_out_15, d_k_out_16;
output reg [5:0] PIPEWIDTH;
output reg [1:0] LMCSyncHeader_1, LMCSyncHeader_2, LMCSyncHeader_3, LMCSyncHeader_4, LMCSyncHeader_5, LMCSyncHeader_6, LMCSyncHeader_7, LMCSyncHeader_8, LMCSyncHeader_9, LMCSyncHeader_10, LMCSyncHeader_11, LMCSyncHeader_12, LMCSyncHeader_13, LMCSyncHeader_14, LMCSyncHeader_15, LMCSyncHeader_16;

reg [5:0] pipe_width;
reg [4:0] count= 0;

always@(generation) begin
    if(generation==1)
        pipe_width = pipe_width_gen1; 
    else if (generation==2)
        pipe_width = pipe_width_gen2; 
    else if (generation==3)
        pipe_width = pipe_width_gen3; 
    else if (generation==4)
        pipe_width = pipe_width_gen4;                 
    else if (generation==5)
        pipe_width = pipe_width_gen5;

    PIPEWIDTH= pipe_width; 
end

always @(posedge pclk or negedge reset_n) begin

  if(generation >= 3 && reset_n) begin

    if(MUXSyncHeader==1 && count==0) begin  // when MUX = 1 --> Ordered Set
        LMCSyncHeader_1 =10;
        LMCSyncHeader_2 =10;
        LMCSyncHeader_3 =10;
        LMCSyncHeader_4 =10;
        LMCSyncHeader_5 =10;
        LMCSyncHeader_6 =10;
        LMCSyncHeader_7 =10;
        LMCSyncHeader_8 =10;
        LMCSyncHeader_9 =10;
        LMCSyncHeader_10 =10;
        LMCSyncHeader_11 =10;
        LMCSyncHeader_12 =10;
        LMCSyncHeader_13 =10;
        LMCSyncHeader_14 =10;
        LMCSyncHeader_15 =10;
        LMCSyncHeader_16 =10;
        count = count + 1;
    end
    else if(PIPEWIDTH==6'b001000 && MUXSyncHeader==1 && count>0) begin

            if(MUXSyncHeader==1 && count==16) begin
                LMCSyncHeader_1 =10;
                LMCSyncHeader_2 =10;
                LMCSyncHeader_3 =10;
                LMCSyncHeader_4 =10;
                LMCSyncHeader_5 =10;
                LMCSyncHeader_6 =10;
                LMCSyncHeader_7 =10;
                LMCSyncHeader_8 =10;
                LMCSyncHeader_9 =10;
                LMCSyncHeader_10 =10;
                LMCSyncHeader_11 =10;
                LMCSyncHeader_12 =10;
                LMCSyncHeader_13 =10;
                LMCSyncHeader_14 =10;
                LMCSyncHeader_15 =10;
                LMCSyncHeader_16 =10;
                count=1;
            end
            else begin
                LMCSyncHeader_1 =0;
                LMCSyncHeader_2 =0;
                LMCSyncHeader_3 =0;
                LMCSyncHeader_4 =0;
                LMCSyncHeader_5 =0;
                LMCSyncHeader_6 =0;
                LMCSyncHeader_7 =0;
                LMCSyncHeader_8 =0;
                LMCSyncHeader_9 =0;
                LMCSyncHeader_10 =0;
                LMCSyncHeader_11 =0;
                LMCSyncHeader_12 =0;
                LMCSyncHeader_13 =0;
                LMCSyncHeader_14 =0;
                LMCSyncHeader_15 =0;
                LMCSyncHeader_16 =0;
                count = count + 1;
            end

        end
    else if(PIPEWIDTH==6'b010000 && MUXSyncHeader==1 && count>0) begin

            if(MUXSyncHeader==1 && count==8) begin
                LMCSyncHeader_1 =10;
                LMCSyncHeader_2 =10;
                LMCSyncHeader_3 =10;
                LMCSyncHeader_4 =10;
                LMCSyncHeader_5 =10;
                LMCSyncHeader_6 =10;
                LMCSyncHeader_7 =10;
                LMCSyncHeader_8 =10;
                LMCSyncHeader_9 =10;
                LMCSyncHeader_10 =10;
                LMCSyncHeader_11 =10;
                LMCSyncHeader_12 =10;
                LMCSyncHeader_13 =10;
                LMCSyncHeader_14 =10;
                LMCSyncHeader_15 =10;
                LMCSyncHeader_16 =10;
                count=1;
            end
            else begin
                LMCSyncHeader_1 =0;
                LMCSyncHeader_2 =0;
                LMCSyncHeader_3 =0;
                LMCSyncHeader_4 =0;
                LMCSyncHeader_5 =0;
                LMCSyncHeader_6 =0;
                LMCSyncHeader_7 =0;
                LMCSyncHeader_8 =0;
                LMCSyncHeader_9 =0;
                LMCSyncHeader_10 =0;
                LMCSyncHeader_11 =0;
                LMCSyncHeader_12 =0;
                LMCSyncHeader_13 =0;
                LMCSyncHeader_14 =0;
                LMCSyncHeader_15 =0;
                LMCSyncHeader_16 =0;   
                count = count + 1;
            end
        end

    else if(PIPEWIDTH==6'b100000 && MUXSyncHeader==1 && count>0) begin

            if(MUXSyncHeader==1 && count==4) begin
                LMCSyncHeader_1 =10;
                LMCSyncHeader_2 =10;
                LMCSyncHeader_3 =10;
                LMCSyncHeader_4 =10;
                LMCSyncHeader_5 =10;
                LMCSyncHeader_6 =10;
                LMCSyncHeader_7 =10;
                LMCSyncHeader_8 =10;
                LMCSyncHeader_9 =10;
                LMCSyncHeader_10 =10;
                LMCSyncHeader_11 =10;
                LMCSyncHeader_12 =10;
                LMCSyncHeader_13 =10;
                LMCSyncHeader_14 =10;
                LMCSyncHeader_15 =10;
                LMCSyncHeader_16 =10;
                count=1;
            end
            else begin
                LMCSyncHeader_1 =0;
                LMCSyncHeader_2 =0;
                LMCSyncHeader_3 =0;
                LMCSyncHeader_4 =0;
                LMCSyncHeader_5 =0;
                LMCSyncHeader_6 =0;
                LMCSyncHeader_7 =0;
                LMCSyncHeader_8 =0;
                LMCSyncHeader_9 =0;
                LMCSyncHeader_10 =0;
                LMCSyncHeader_11 =0;
                LMCSyncHeader_12 =0;
                LMCSyncHeader_13 =0;
                LMCSyncHeader_14 =0;
                LMCSyncHeader_15 =0;
                LMCSyncHeader_16 =0;
                count = count + 1;
            end 
    end
  

    else if(MUXSyncHeader==0 && count==0) begin    ///////// Data Block
        LMCSyncHeader_1 =01;
        LMCSyncHeader_2 =01;
        LMCSyncHeader_3 =01;
        LMCSyncHeader_4 =01;
        LMCSyncHeader_5 =01;
        LMCSyncHeader_6 =01;
        LMCSyncHeader_7 =01;
        LMCSyncHeader_8 =01;
        LMCSyncHeader_9 =01;
        LMCSyncHeader_10 =01;
        LMCSyncHeader_11 =01;
        LMCSyncHeader_12 =01;
        LMCSyncHeader_13 =01;
        LMCSyncHeader_14 =01;
        LMCSyncHeader_15 =01;
        LMCSyncHeader_16 =01;
        count = count + 1;     
    end 

    else if(PIPEWIDTH==6'b001000 && MUXSyncHeader==0 && count>0) begin

            if(MUXSyncHeader==0 && count==16) begin
                LMCSyncHeader_1 =01;
                LMCSyncHeader_2 =01;
                LMCSyncHeader_3 =01;
                LMCSyncHeader_4 =01;
                LMCSyncHeader_5 =01;
                LMCSyncHeader_6 =01;
                LMCSyncHeader_7 =01;
                LMCSyncHeader_8 =01;
                LMCSyncHeader_9 =01;
                LMCSyncHeader_10 =01;
                LMCSyncHeader_11 =01;
                LMCSyncHeader_12 =01;
                LMCSyncHeader_13 =01;
                LMCSyncHeader_14 =01;
                LMCSyncHeader_15 =01;
                LMCSyncHeader_16 =01;
                count=1;
            end
            else begin
                LMCSyncHeader_1 =0;
                LMCSyncHeader_2 =0;
                LMCSyncHeader_3 =0;
                LMCSyncHeader_4 =0;
                LMCSyncHeader_5 =0;
                LMCSyncHeader_6 =0;
                LMCSyncHeader_7 =0;
                LMCSyncHeader_8 =0;
                LMCSyncHeader_9 =0;
                LMCSyncHeader_10 =0;
                LMCSyncHeader_11 =0;
                LMCSyncHeader_12 =0;
                LMCSyncHeader_13 =0;
                LMCSyncHeader_14 =0;
                LMCSyncHeader_15 =0;
                LMCSyncHeader_16 =0;
                count = count + 1;
            end

        end
        else if(PIPEWIDTH==6'b010000 && MUXSyncHeader==0 && count>0) begin

            if(MUXSyncHeader==0 && count==8) begin
                LMCSyncHeader_1 =01;
                LMCSyncHeader_2 =01;
                LMCSyncHeader_3 =01;
                LMCSyncHeader_4 =01;
                LMCSyncHeader_5 =01;
                LMCSyncHeader_6 =01;
                LMCSyncHeader_7 =01;
                LMCSyncHeader_8 =01;
                LMCSyncHeader_9 =01;
                LMCSyncHeader_10 =01;
                LMCSyncHeader_11 =01;
                LMCSyncHeader_12 =01;
                LMCSyncHeader_13 =01;
                LMCSyncHeader_14 =01;
                LMCSyncHeader_15 =01;
                LMCSyncHeader_16 =01;
                count=1;
            end
            else begin
                LMCSyncHeader_1 =0;
                LMCSyncHeader_2 =0;
                LMCSyncHeader_3 =0;
                LMCSyncHeader_4 =0;
                LMCSyncHeader_5 =0;
                LMCSyncHeader_6 =0;
                LMCSyncHeader_7 =0;
                LMCSyncHeader_8 =0;
                LMCSyncHeader_9 =0;
                LMCSyncHeader_10 =0;
                LMCSyncHeader_11 =0;
                LMCSyncHeader_12 =0;
                LMCSyncHeader_13 =0;
                LMCSyncHeader_14 =0;
                LMCSyncHeader_15 =0;
                LMCSyncHeader_16 =0;    
                count = count + 1;
            end
        end

        else if(PIPEWIDTH==6'b100000 && MUXSyncHeader==0 && count>0) begin

            if(MUXSyncHeader==1 && count==4) begin
                LMCSyncHeader_1 =01;
                LMCSyncHeader_2 =01;
                LMCSyncHeader_3 =01;
                LMCSyncHeader_4 =01;
                LMCSyncHeader_5 =01;
                LMCSyncHeader_6 =01;
                LMCSyncHeader_7 =01;
                LMCSyncHeader_8 =01;
                LMCSyncHeader_9 =01;
                LMCSyncHeader_10 =01;
                LMCSyncHeader_11 =01;
                LMCSyncHeader_12 =01;
                LMCSyncHeader_13 =01;
                LMCSyncHeader_14 =01;
                LMCSyncHeader_15 =01;
                LMCSyncHeader_16 =01;
                count=1;
            end
            else begin
                LMCSyncHeader_1 =0;
                LMCSyncHeader_2 =0;
                LMCSyncHeader_3 =0;
                LMCSyncHeader_4 =0;
                LMCSyncHeader_5 =0;
                LMCSyncHeader_6 =0;
                LMCSyncHeader_7 =0;
                LMCSyncHeader_8 =0;
                LMCSyncHeader_9 =0;
                LMCSyncHeader_10 =0;
                LMCSyncHeader_11 =0;
                LMCSyncHeader_12 =0;
                LMCSyncHeader_13 =0;
                LMCSyncHeader_14 =0;
                LMCSyncHeader_15 =0;
                LMCSyncHeader_16 =0;
                count = count + 1;
            end  
        end

        else
            count =0;

  end

  if (~reset_n) begin
    dataout_1=0;
    dataout_2=0; 
    dataout_3=0;
    dataout_4=0; 
    dataout_5=0;
    dataout_6=0;
    dataout_7=0;
    dataout_8=0;
    dataout_9=0;
    dataout_10=0;
    dataout_11=0;
    dataout_12=0;
    dataout_13=0;
    dataout_14=0;
    dataout_15=0;
    dataout_16=0;

    d_k_out_1=0;
    d_k_out_2=0;
    d_k_out_3=0;
    d_k_out_4=0;
    d_k_out_5=0;
    d_k_out_6=0;
    d_k_out_7=0;
    d_k_out_8=0;
    d_k_out_9=0;
    d_k_out_10=0;
    d_k_out_11=0;
    d_k_out_12=0;
    d_k_out_13=0;
    d_k_out_14=0;
    d_k_out_15=0;
    d_k_out_16=0;

    data_valid_out_1=0;
    data_valid_out_2=0;
    data_valid_out_3=0;
    data_valid_out_4=0;
    data_valid_out_5=0;
    data_valid_out_6=0;
    data_valid_out_7=0;
    data_valid_out_8=0;
    data_valid_out_9=0;
    data_valid_out_10=0;
    data_valid_out_11=0;
    data_valid_out_12=0;
    data_valid_out_13=0;
    data_valid_out_14=0;
    data_valid_out_15=0;
    data_valid_out_16=0;

    LMCSyncHeader_1 =0;
    LMCSyncHeader_2 =0;
    LMCSyncHeader_3 =0;
    LMCSyncHeader_4 =0;
    LMCSyncHeader_5 =0;
    LMCSyncHeader_6 =0;
    LMCSyncHeader_7 =0;
    LMCSyncHeader_8 =0;
    LMCSyncHeader_9 =0;
    LMCSyncHeader_10 =0;
    LMCSyncHeader_11 =0;
    LMCSyncHeader_12 =0;
    LMCSyncHeader_13 =0;
    LMCSyncHeader_14 =0;
    LMCSyncHeader_15 =0;
    LMCSyncHeader_16 =0;

    count =0;
  end

  else if (data_valid[0] == 0) begin
    dataout_1=0;
    dataout_2=0; 
    dataout_3=0;
    dataout_4=0; 
    dataout_5=0;
    dataout_6=0;
    dataout_7=0;
    dataout_8=0;
    dataout_9=0;
    dataout_10=0;
    dataout_11=0;
    dataout_12=0;
    dataout_13=0;
    dataout_14=0;
    dataout_15=0;
    dataout_16=0;

    d_k_out_1=0;
    d_k_out_2=0;
    d_k_out_3=0;
    d_k_out_4=0;
    d_k_out_5=0;
    d_k_out_6=0;
    d_k_out_7=0;
    d_k_out_8=0;
    d_k_out_9=0;
    d_k_out_10=0;
    d_k_out_11=0;
    d_k_out_12=0;
    d_k_out_13=0;
    d_k_out_14=0;
    d_k_out_15=0;
    d_k_out_16=0;

    data_valid_out_1=0;
    data_valid_out_2=0;
    data_valid_out_3=0;
    data_valid_out_4=0;
    data_valid_out_5=0;
    data_valid_out_6=0;
    data_valid_out_7=0;
    data_valid_out_8=0;
    data_valid_out_9=0;
    data_valid_out_10=0;
    data_valid_out_11=0;
    data_valid_out_12=0;
    data_valid_out_13=0;
    data_valid_out_14=0;
    data_valid_out_15=0;
    data_valid_out_16=0;

    LMCSyncHeader_1 =0;
    LMCSyncHeader_2 =0;
    LMCSyncHeader_3 =0;
    LMCSyncHeader_4 =0;
    LMCSyncHeader_5 =0;
    LMCSyncHeader_6 =0;
    LMCSyncHeader_7 =0;
    LMCSyncHeader_8 =0;
    LMCSyncHeader_9 =0;
    LMCSyncHeader_10 =0;
    LMCSyncHeader_11 =0;
    LMCSyncHeader_12 =0;
    LMCSyncHeader_13 =0;
    LMCSyncHeader_14 =0;
    LMCSyncHeader_15 =0;
    LMCSyncHeader_16 =0;

    count =0;
  end

  else if (pipe_width == 8 && number_of_lanes == 1) begin
            if (data_valid[0] == 1) begin
                dataout_1= data[7:0];
                d_k_out_1= d_k_in;
                data_valid_out_1= 1'b1;
            end
  end

  else if (pipe_width == 16 && number_of_lanes == 1) begin
            if (data_valid[1] == 1 && data_valid[0] == 1) begin
                dataout_1= {data[7:0] , data[15:8]};
                d_k_out_1= {d_k_in[0] , d_k_in[1]};
                data_valid_out_1= 1'b1;                
            end
  end

  else if (pipe_width == 32 && number_of_lanes == 1) begin

            data_valid_out_1= 1'b1; 

            if(data_valid[3] == 1 && data_valid[0] == 1) begin
                dataout_1= {data[7:0] , data[15:8] , data[23:16] , data[31:24]};
                d_k_out_1= {d_k_in[0] , d_k_in[1] , d_k_in[2] , d_k_in[3]};                               
            end
            else if (data_valid[1] == 0 && data_valid[0] == 1) begin
                 if(generation >= 3)
                     dataout_1= {data[7:0] , 24'b0};
                 else
                     dataout_1= {data[7:0] , 24'hf7f7f7};
 
                d_k_out_1= {d_k_in[0] , 3'b111 };
            end
            else if (data_valid[2] == 0 && data_valid[0] == 1) begin
                  if(generation >= 3)
                      dataout_1= {data[7:0] , data[15:8] , 16'b0};
                  else
                      dataout_1= {data[7:0] , data[15:8] , 16'hf7f7};

                d_k_out_1= {d_k_in[0] , d_k_in[1] , 2'b11};
            end
            else if (data_valid[3] == 0 && data_valid[0] == 1) begin
                    if(generation >= 3)
                      dataout_1= {data[7:0] , data[15:8] , data[23:16] , 8'b0};
                    else 
                      dataout_1= {data[7:0] , data[15:8] , data[23:16] , 8'hf7};

                d_k_out_1= {d_k_in[0] , d_k_in[1] , d_k_in[2] , 1'b1};
            end
  end    

  else if (pipe_width == 8 && number_of_lanes == 4) begin

                data_valid_out_1= 1'b1;
                data_valid_out_2= 1'b1;
                data_valid_out_3= 1'b1;
                data_valid_out_4= 1'b1;

            if( data_valid[3] == 1 && data_valid[0] == 1) begin
                dataout_1= data[7:0];
                dataout_2= data[15:8]; 
                dataout_3= data[23:16];
                dataout_4= data[32:24];

                d_k_out_1= d_k_in[0];
                d_k_out_2= d_k_in[1];
                d_k_out_3= d_k_in[2];
                d_k_out_4= d_k_in[3];
            end            
  end

  else if (pipe_width == 16 && number_of_lanes == 4) begin

                data_valid_out_1= 1'b1;
                data_valid_out_2= 1'b1;
                data_valid_out_3= 1'b1;
                data_valid_out_4= 1'b1;

            if( data_valid[7] == 1 && data_valid[0] == 1) begin
                dataout_1= {data[7:0] , data[39:32]};
                dataout_2= {data[15:8] , data[47:40]}; 
                dataout_3= {data[23:16] , data[55:48]};
                dataout_4= {data[31:24] , data[63:56]};

                d_k_out_1= {d_k_in[0] , d_k_in[4]};
                d_k_out_2= {d_k_in[1] , d_k_in[5]};
                d_k_out_3= {d_k_in[2] , d_k_in[6]};
                d_k_out_4= {d_k_in[3] , d_k_in[7]};
            end
            else if( data_valid[4] == 0 && data_valid[0] == 1) begin
                if (generation>=3) begin
                        dataout_1= {data[7:0] , 8'b0};
                        dataout_2= {data[15:8] , 8'b0}; 
                        dataout_3= {data[23:16] , 8'b0};
                        dataout_4= {data[31:24] , 8'b0};
                end
                else begin
                        dataout_1= {data[7:0] , 8'hf7};
                        dataout_2= {data[15:8] , 8'hf7}; 
                        dataout_3= {data[23:16] , 8'hf7};
                        dataout_4= {data[31:24] , 8'hf7};
                end

                d_k_out_1= {d_k_in[0] , 1'b1};
                d_k_out_2= {d_k_in[1] , 1'b1};
                d_k_out_3= {d_k_in[2] , 1'b1};
                d_k_out_4= {d_k_in[3] , 1'b1};
            end
  end

  else if (pipe_width == 32 && number_of_lanes == 4) begin

                data_valid_out_1= 1'b1;
                data_valid_out_2= 1'b1;
                data_valid_out_3= 1'b1;
                data_valid_out_4= 1'b1;

            if( data_valid[15] == 1 && data_valid[0] == 1) begin
                dataout_1= {data[7:0] , data[39:32] , data[71:64] , data[103:96]};
                dataout_2= {data[15:8] , data[47:40] , data[79:72] , data[111:104]}; 
                dataout_3= {data[23:16] , data[55:48] , data[87:80] , data[119:112]};
                dataout_4= {data[31:24] , data[63:56] , data[95:88] , data[127:120]};

                d_k_out_1= {d_k_in[0] , d_k_in[4] , d_k_in[8] , d_k_in[12]};
                d_k_out_2= {d_k_in[1] , d_k_in[5] , d_k_in[9] , d_k_in[13]};
                d_k_out_3= {d_k_in[2] , d_k_in[6] , d_k_in[10] , d_k_in[14]};
                d_k_out_4= {d_k_in[3] , d_k_in[7] , d_k_in[11] , d_k_in[15]};
            end      
            else if( data_valid[4] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , 24'b0};
                        dataout_2= {data[15:8] , 24'b0}; 
                        dataout_3= {data[23:16] , 24'b0};
                        dataout_4= {data[31:24] , 24'b0};                         
                    end
                    else begin
                        dataout_1= {data[7:0] , 24'hf7f7f7};
                        dataout_2= {data[15:8] , 24'hf7f7f7}; 
                        dataout_3= {data[23:16] , 24'hf7f7f7};
                        dataout_4= {data[31:24] , 24'hf7f7f7}; 
                    end


                d_k_out_1= {d_k_in[0] , 3'b111};
                d_k_out_2= {d_k_in[1] , 3'b111};
                d_k_out_3= {d_k_in[2] , 3'b111};
                d_k_out_4= {d_k_in[3] , 3'b111};
            end 
            else if( data_valid[8] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[39:32] , 16'b0};
                        dataout_2= {data[15:8] , data[47:40] , 16'b0}; 
                        dataout_3= {data[23:16] , data[55:48] , 16'b0};
                        dataout_4= {data[31:24] , data[63:56] , 16'b0};
                    end
                    else begin
                        dataout_1= {data[7:0] , data[39:32] , 16'hf7f7};
                        dataout_2= {data[15:8] , data[47:40] , 16'hf7f7}; 
                        dataout_3= {data[23:16] , data[55:48] , 16'hf7f7};
                        dataout_4= {data[31:24] , data[63:56] , 16'hf7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[4] , 2'b11};
                d_k_out_2= {d_k_in[1] , d_k_in[5] , 2'b11};
                d_k_out_3= {d_k_in[2] , d_k_in[6] , 2'b11};
                d_k_out_4= {d_k_in[3] , d_k_in[7] , 2'b11};
            end 
            else if( data_valid[12] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[39:32] , data[71:64] , 8'b0};
                        dataout_2= {data[15:8] , data[47:40] , data[79:72] , 8'b0}; 
                        dataout_3= {data[23:16] , data[55:48] , data[87:80] , 8'b0};
                        dataout_4= {data[31:24] , data[63:56] , data[95:88] , 8'b0};
                    end
                    else begin
                        dataout_1= {data[7:0] , data[39:32] , data[71:64] , 8'hf7};
                        dataout_2= {data[15:8] , data[47:40] , data[79:72] , 8'hf7}; 
                        dataout_3= {data[23:16] , data[55:48] , data[87:80] , 8'hf7};
                        dataout_4= {data[31:24] , data[63:56] , data[95:88] , 8'hf7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[4] , d_k_in[8] , 1'b1};
                d_k_out_2= {d_k_in[1] , d_k_in[5] , d_k_in[9] , 1'b1};
                d_k_out_3= {d_k_in[2] , d_k_in[6] , d_k_in[10] , 1'b1};
                d_k_out_4= {d_k_in[3] , d_k_in[7] , d_k_in[11] , 1'b1};
            end     
  end

  else if (pipe_width == 8 && number_of_lanes == 8) begin

                data_valid_out_1= 1'b1;
                data_valid_out_2= 1'b1;
                data_valid_out_3= 1'b1;
                data_valid_out_4= 1'b1;
                data_valid_out_5= 1'b1;
                data_valid_out_6= 1'b1;
                data_valid_out_7= 1'b1;
                data_valid_out_8= 1'b1;

            if(data_valid[7] == 1 && data_valid[0] == 1) begin
                dataout_1= data[7:0];
                dataout_2= data[15:8]; 
                dataout_3= data[23:16];
                dataout_4= data[31:24];
                dataout_5= data[39:32];
                dataout_6= data[47:40]; 
                dataout_7= data[55:48];
                dataout_8= data[63:56];

                d_k_out_1= d_k_in[0];
                d_k_out_2= d_k_in[1];
                d_k_out_3= d_k_in[2];
                d_k_out_4= d_k_in[3];
                d_k_out_5= d_k_in[4];
                d_k_out_6= d_k_in[5];
                d_k_out_7= d_k_in[6];
                d_k_out_8= d_k_in[7]; 
            end
            else if(data_valid[4] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= data[7:0];
                        dataout_2= data[15:8]; 
                        dataout_3= data[23:16];
                        dataout_4= data[31:24];
                        dataout_5= 8'b0;
                        dataout_6= 8'b0; 
                        dataout_7= 8'b0;
                        dataout_8= 8'b0;  
                    end
                    else begin
                        dataout_1= data[7:0];
                        dataout_2= data[15:8]; 
                        dataout_3= data[23:16];
                        dataout_4= data[31:24];
                        dataout_5= 8'hf7;
                        dataout_6= 8'hf7; 
                        dataout_7= 8'hf7;
                        dataout_8= 8'hf7;                        
                    end


                d_k_out_1= d_k_in[0];
                d_k_out_2= d_k_in[1];
                d_k_out_3= d_k_in[2];
                d_k_out_4= d_k_in[3];
                d_k_out_5= 1;
                d_k_out_6= 1;
                d_k_out_7= 1;
                d_k_out_8= 1; 
            end
  end

  else if (pipe_width == 16 && number_of_lanes == 8) begin

                data_valid_out_1= 1'b1;
                data_valid_out_2= 1'b1;
                data_valid_out_3= 1'b1;
                data_valid_out_4= 1'b1;
                data_valid_out_5= 1'b1;
                data_valid_out_6= 1'b1;
                data_valid_out_7= 1'b1;
                data_valid_out_8= 1'b1;  

            if(data_valid[15] == 1 && data_valid[0] == 1) begin
                dataout_1= {data[7:0] , data[71:64]};
                dataout_2= {data[15:8] , data[79:72]}; 
                dataout_3= {data[23:16] , data[87:80]};
                dataout_4= {data[31:24] , data[95:88]};
                dataout_5= {data[39:32] , data[103:96]};
                dataout_6= {data[47:40] , data[111:104]}; 
                dataout_7= {data[55:48] , data[119:112]};
                dataout_8= {data[63:56] , data[127:120]};

                d_k_out_1= {d_k_in[0] , d_k_in[8]};
                d_k_out_2= {d_k_in[1] , d_k_in[9]};
                d_k_out_3= {d_k_in[2] , d_k_in[10]};
                d_k_out_4= {d_k_in[3] , d_k_in[11]};
                d_k_out_5= {d_k_in[4] , d_k_in[12]};
                d_k_out_6= {d_k_in[5] , d_k_in[13]};
                d_k_out_7= {d_k_in[6] , d_k_in[14]};
                d_k_out_8= {d_k_in[7] , d_k_in[15]};                
            end
            else if(data_valid[4] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , 8'b0};
                        dataout_2= {data[15:8] , 8'b0}; 
                        dataout_3= {data[23:16] , 8'b0};
                        dataout_4= {data[31:24] , 8'b0};
                        dataout_5= {16'b0};
                        dataout_6= {16'b0}; 
                        dataout_7= {16'b0};
                        dataout_8= {16'b0};             
                    end
                    else begin
                        dataout_1= {data[7:0] , 8'hf7};
                        dataout_2= {data[15:8] , 8'hf7}; 
                        dataout_3= {data[23:16] , 8'hf7};
                        dataout_4= {data[31:24] , 8'hf7};
                        dataout_5= {16'hf7f7};
                        dataout_6= {16'hf7f7}; 
                        dataout_7= {16'hf7f7};
                        dataout_8= {16'hf7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , 1'b1};
                d_k_out_2= {d_k_in[1] , 1'b1};
                d_k_out_3= {d_k_in[2] , 1'b1};
                d_k_out_4= {d_k_in[3] , 1'b1};
                d_k_out_5= 2'b11;
                d_k_out_6= 2'b11;
                d_k_out_7= 2'b11;
                d_k_out_8= 2'b11;                
            end
            else if(data_valid[8] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , 8'b0};
                        dataout_2= {data[15:8] , 8'b0}; 
                        dataout_3= {data[23:16] , 8'b0};
                        dataout_4= {data[31:24] , 8'b0};
                        dataout_5= {data[39:32] , 8'b0};
                        dataout_6= {data[47:40] , 8'b0}; 
                        dataout_7= {data[55:48] , 8'b0};
                        dataout_8= {data[63:56] , 8'b0};
                    end
                    else begin
                        dataout_1= {data[7:0] , 8'hf7};
                        dataout_2= {data[15:8] , 8'hf7}; 
                        dataout_3= {data[23:16] , 8'hf7};
                        dataout_4= {data[31:24] , 8'hf7};
                        dataout_5= {data[39:32] , 8'hf7};
                        dataout_6= {data[47:40] , 8'hf7}; 
                        dataout_7= {data[55:48] , 8'hf7};
                        dataout_8= {data[63:56] , 8'hf7};                        
                    end


                d_k_out_1= {d_k_in[0] , 1'b1};
                d_k_out_2= {d_k_in[1] , 1'b1};
                d_k_out_3= {d_k_in[2] , 1'b1};
                d_k_out_4= {d_k_in[3] , 1'b1};
                d_k_out_5= {d_k_in[4] , 1'b1};
                d_k_out_6= {d_k_in[5] , 1'b1};
                d_k_out_7= {d_k_in[6] , 1'b1};
                d_k_out_8= {d_k_in[7] , 1'b1};                
            end
            else if(data_valid[12] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[71:64]};
                        dataout_2= {data[15:8] , data[79:72]}; 
                        dataout_3= {data[23:16] , data[87:80]};
                        dataout_4= {data[31:24] , data[95:88]};
                        dataout_5= {data[39:32] , 8'b0};
                        dataout_6= {data[47:40] , 8'b0}; 
                        dataout_7= {data[55:48] , 8'b0};
                        dataout_8= {data[63:56] , 8'b0};
                    end
                    else begin
                        dataout_1= {data[7:0] , data[71:64]};
                        dataout_2= {data[15:8] , data[79:72]}; 
                        dataout_3= {data[23:16] , data[87:80]};
                        dataout_4= {data[31:24] , data[95:88]};
                        dataout_5= {data[39:32] , 8'hf7};
                        dataout_6= {data[47:40] , 8'hf7}; 
                        dataout_7= {data[55:48] , 8'hf7};
                        dataout_8= {data[63:56] , 8'hf7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[8]};
                d_k_out_2= {d_k_in[1] , d_k_in[9]};
                d_k_out_3= {d_k_in[2] , d_k_in[10]};
                d_k_out_4= {d_k_in[3] , d_k_in[11]};
                d_k_out_5= {d_k_in[4] , 1'b1};
                d_k_out_6= {d_k_in[5] , 1'b1};
                d_k_out_7= {d_k_in[6] , 1'b1};
                d_k_out_8= {d_k_in[7] , 1'b1};                
            end            
  end

  else if (pipe_width == 32 && number_of_lanes == 8) begin

                data_valid_out_1= 1'b1;
                data_valid_out_2= 1'b1;
                data_valid_out_3= 1'b1;
                data_valid_out_4= 1'b1;
                data_valid_out_5= 1'b1;
                data_valid_out_6= 1'b1;
                data_valid_out_7= 1'b1;
                data_valid_out_8= 1'b1;   

            if(data_valid[31] == 1 && data_valid[0] == 1) begin
                dataout_1= {data[7:0], data[71:64], data[135:128], data[199:192]};
                dataout_2= {data[15:8], data[79:72] , data[143:136] , data[207:200]}; 
                dataout_3= {data[23:16] , data[87:80] , data[151:144] , data[215:208]};
                dataout_4= {data[31:24] , data[95:88] , data[159:152] , data[223:216]};
                dataout_5= {data[39:32] , data[103:96] , data[167:160] , data[231:224]};
                dataout_6= {data[47:40] , data[111:104] , data[175:168] , data[239:232]}; 
                dataout_7= {data[55:48] , data[119:112] , data[183:176] , data[247:240]};
                dataout_8= {data[63:56] , data[127:120] , data[191:184] , data[255:248]};

                d_k_out_1= {d_k_in[0] , d_k_in[8] , d_k_in[16] , d_k_in[24]};
                d_k_out_2= {d_k_in[1] , d_k_in[9] , d_k_in[17] , d_k_in[25]};
                d_k_out_3= {d_k_in[2] , d_k_in[10] , d_k_in[18] , d_k_in[26]};
                d_k_out_4= {d_k_in[3] , d_k_in[11] , d_k_in[19] , d_k_in[27]};
                d_k_out_5= {d_k_in[4] , d_k_in[12] , d_k_in[20] , d_k_in[28]};
                d_k_out_6= {d_k_in[5] , d_k_in[13] , d_k_in[21] , d_k_in[29]};
                d_k_out_7= {d_k_in[6] , d_k_in[14] , d_k_in[22] , d_k_in[30]};
                d_k_out_8= {d_k_in[7] , d_k_in[15] , d_k_in[23] , d_k_in[31]};                 
            end
            else if(data_valid[4] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , 24'b0};
                        dataout_2= {data[15:8] , 24'b0}; 
                        dataout_3= {data[23:16] , 24'b0};
                        dataout_4= {data[31:24] , 24'b0};
                        dataout_5= {32'b0};
                        dataout_6= {32'b0}; 
                        dataout_7= {32'b0};
                        dataout_8= {32'b0}; 
                    end
                    else begin
                        dataout_1= {data[7:0] , 24'hf7f7f7};
                        dataout_2= {data[15:8] , 24'hf7f7f7}; 
                        dataout_3= {data[23:16] , 24'hf7f7f7};
                        dataout_4= {data[31:24] , 24'hf7f7f7};
                        dataout_5= {32'hf7f7f7f7};
                        dataout_6= {32'hf7f7f7f7}; 
                        dataout_7= {32'hf7f7f7f7};
                        dataout_8= {32'hf7f7f7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , 3'b111};
                d_k_out_2= {d_k_in[1] , 3'b111};
                d_k_out_3= {d_k_in[2] , 3'b111};
                d_k_out_4= {d_k_in[3] , 3'b111};
                d_k_out_5= 4'b1111; 
                d_k_out_6= 4'b1111;
                d_k_out_7= 4'b1111;
                d_k_out_8= 4'b1111;                 
            end             
            else if(data_valid[8] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , 24'b0};
                        dataout_2= {data[15:8] , 24'b0}; 
                        dataout_3= {data[23:16] , 24'b0};
                        dataout_4= {data[31:24] , 24'b0};
                        dataout_5= {data[39:32] , 24'b0};
                        dataout_6= {data[47:40] , 24'b0}; 
                        dataout_7= {data[55:48] , 24'b0};
                        dataout_8= {data[63:56] , 24'b0}; 
                    end
                    else begin
                        dataout_1= {data[7:0] , 24'hf7f7f7};
                        dataout_2= {data[15:8] , 24'hf7f7f7}; 
                        dataout_3= {data[23:16] , 24'hf7f7f7};
                        dataout_4= {data[31:24] , 24'hf7f7f7};
                        dataout_5= {data[39:32] , 24'hf7f7f7};
                        dataout_6= {data[47:40] , 24'hf7f7f7}; 
                        dataout_7= {data[55:48] , 24'hf7f7f7};
                        dataout_8= {data[63:56] , 24'hf7f7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , 3'b111};
                d_k_out_2= {d_k_in[1] , 3'b111};
                d_k_out_3= {d_k_in[2] , 3'b111};
                d_k_out_4= {d_k_in[3] , 3'b111};
                d_k_out_5= {d_k_in[4] , 3'b111};
                d_k_out_6= {d_k_in[5] , 3'b111};
                d_k_out_7= {d_k_in[6] , 3'b111};
                d_k_out_8= {d_k_in[7] , 3'b111};                 
            end
            else if(data_valid[12] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[71:64] , 16'b0};
                        dataout_2= {data[15:8] , data[79:72] , 16'b0}; 
                        dataout_3= {data[23:16] , data[87:80] , 16'b0};
                        dataout_4= {data[31:24] , data[95:88] , 16'b0};
                        dataout_5= {data[39:32] , 24'b0};
                        dataout_6= {data[47:40] , 24'b0}; 
                        dataout_7= {data[55:48] , 24'b0};
                        dataout_8= {data[63:56] , 24'b0};       
                    end
                    else begin
                        dataout_1= {data[7:0] , data[71:64] , 16'hf7f7};
                        dataout_2= {data[15:8] , data[79:72] , 16'hf7f7}; 
                        dataout_3= {data[23:16] , data[87:80] , 16'hf7f7};
                        dataout_4= {data[31:24] , data[95:88] , 16'hf7f7};
                        dataout_5= {data[39:32] , 24'hf7f7f7};
                        dataout_6= {data[47:40] , 24'hf7f7f7}; 
                        dataout_7= {data[55:48] , 24'hf7f7f7};
                        dataout_8= {data[63:56] , 24'hf7f7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[8] , 2'b11};
                d_k_out_2= {d_k_in[1] , d_k_in[9] , 2'b11};
                d_k_out_3= {d_k_in[2] , d_k_in[10] , 2'b11};
                d_k_out_4= {d_k_in[3] , d_k_in[11] , 2'b11};
                d_k_out_5= {d_k_in[4] , 3'b111};
                d_k_out_6= {d_k_in[5] , 3'b111};
                d_k_out_7= {d_k_in[6] , 3'b111};
                d_k_out_8= {d_k_in[7] , 3'b111};                 
            end              
            else if(data_valid[16] == 0 && data_valid[0] == 1) begin
                        if(generation>=3) begin
                            dataout_1= {data[7:0] , data[71:64] , 16'b0};
                            dataout_2= {data[15:8] , data[79:72] , 16'b0}; 
                            dataout_3= {data[23:16] , data[87:80] , 16'b0};
                            dataout_4= {data[31:24] , data[95:88] , 16'b0};
                            dataout_5= {data[39:32] , data[103:96] , 16'b0};
                            dataout_6= {data[47:40] , data[111:104] , 16'b0}; 
                            dataout_7= {data[55:48] , data[119:112] , 16'b0};
                            dataout_8= {data[63:56] , data[127:120] , 16'b0};
                        end
                        else begin
                            dataout_1= {data[7:0] , data[71:64] , 16'hf7f7};
                            dataout_2= {data[15:8] , data[79:72] , 16'hf7f7}; 
                            dataout_3= {data[23:16] , data[87:80] , 16'hf7f7};
                            dataout_4= {data[31:24] , data[95:88] , 16'hf7f7};
                            dataout_5= {data[39:32] , data[103:96] , 16'hf7f7};
                            dataout_6= {data[47:40] , data[111:104] , 16'hf7f7}; 
                            dataout_7= {data[55:48] , data[119:112] , 16'hf7f7};
                            dataout_8= {data[63:56] , data[127:120] , 16'hf7f7};                            
                        end


                d_k_out_1= {d_k_in[0] , d_k_in[8] , 2'b11};
                d_k_out_2= {d_k_in[1] , d_k_in[9] , 2'b11};
                d_k_out_3= {d_k_in[2] , d_k_in[10] , 2'b11};
                d_k_out_4= {d_k_in[3] , d_k_in[11] , 2'b11};
                d_k_out_5= {d_k_in[4] , d_k_in[12] , 2'b11};
                d_k_out_6= {d_k_in[5] , d_k_in[13] , 2'b11};
                d_k_out_7= {d_k_in[6] , d_k_in[14] , 2'b11};
                d_k_out_8= {d_k_in[7] , d_k_in[15] , 2'b11};                 
            end
            else if(data_valid[20] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[71:64] , data[135:128] , 8'b0};
                        dataout_2= {data[15:8] , data[79:72] , data[143:136] , 8'b0}; 
                        dataout_3= {data[23:16] , data[87:80] , data[151:144] , 8'b0};
                        dataout_4= {data[31:24] , data[95:88] , data[159:152] , 8'b0};
                        dataout_5= {data[39:32] , data[103:96] , 16'b0};
                        dataout_6= {data[47:40] , data[111:104] , 16'b0}; 
                        dataout_7= {data[55:48] , data[119:112] , 16'b0};
                        dataout_8= {data[63:56] , data[127:120] , 16'b0};        
                    end
                    else begin
                        dataout_1= {data[7:0] , data[71:64] , data[135:128] , 8'hf7};
                        dataout_2= {data[15:8] , data[79:72] , data[143:136] , 8'hf7}; 
                        dataout_3= {data[23:16] , data[87:80] , data[151:144] , 8'hf7};
                        dataout_4= {data[31:24] , data[95:88] , data[159:152] , 8'hf7};
                        dataout_5= {data[39:32] , data[103:96] , 16'hf7f7};
                        dataout_6= {data[47:40] , data[111:104] , 16'hf7f7}; 
                        dataout_7= {data[55:48] , data[119:112] , 16'hf7f7};
                        dataout_8= {data[63:56] , data[127:120] , 16'hf7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[8] , d_k_in[16] , 1'b1};
                d_k_out_2= {d_k_in[1] , d_k_in[9] , d_k_in[17] , 1'b1};
                d_k_out_3= {d_k_in[2] , d_k_in[10] , d_k_in[18] , 1'b1};
                d_k_out_4= {d_k_in[3] , d_k_in[11] , d_k_in[19] , 1'b1};
                d_k_out_5= {d_k_in[4] , d_k_in[12] , 2'b11};
                d_k_out_6= {d_k_in[5] , d_k_in[13] , 2'b11};
                d_k_out_7= {d_k_in[6] , d_k_in[14] , 2'b11};
                d_k_out_8= {d_k_in[7] , d_k_in[15] , 2'b11};                 
            end               
            else if(data_valid[24] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[71:64] , data[135:128] , 8'b0};
                        dataout_2= {data[15:8] , data[79:72] , data[143:136] , 8'b0}; 
                        dataout_3= {data[23:16] , data[87:80] , data[151:144] , 8'b0};
                        dataout_4= {data[31:24] , data[95:88] , data[159:152] , 8'b0};
                        dataout_5= {data[39:32] , data[103:96] , data[167:160] , 8'b0};
                        dataout_6= {data[47:40] , data[111:104] , data[175:168] , 8'b0}; 
                        dataout_7= {data[55:48] , data[119:112] , data[183:176] , 8'b0};
                        dataout_8= {data[63:56] , data[127:120] , data[191:184] , 8'b0};                       
                    end
                    else begin
                        dataout_1= {data[7:0] , data[71:64] , data[135:128] , 8'hf7};
                        dataout_2= {data[15:8] , data[79:72] , data[143:136] , 8'hf7}; 
                        dataout_3= {data[23:16] , data[87:80] , data[151:144] , 8'hf7};
                        dataout_4= {data[31:24] , data[95:88] , data[159:152] , 8'hf7};
                        dataout_5= {data[39:32] , data[103:96] , data[167:160] , 8'hf7};
                        dataout_6= {data[47:40] , data[111:104] , data[175:168] , 8'hf7}; 
                        dataout_7= {data[55:48] , data[119:112] , data[183:176] , 8'hf7};
                        dataout_8= {data[63:56] , data[127:120] , data[191:184] , 8'hf7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[8] , d_k_in[16] , 1'b1};
                d_k_out_2= {d_k_in[1] , d_k_in[9] , d_k_in[17] , 1'b1};
                d_k_out_3= {d_k_in[2] , d_k_in[10] , d_k_in[18] , 1'b1};
                d_k_out_4= {d_k_in[3] , d_k_in[11] , d_k_in[19] , 1'b1};
                d_k_out_5= {d_k_in[4] , d_k_in[12] , d_k_in[20] , 1'b1};
                d_k_out_6= {d_k_in[5] , d_k_in[13] , d_k_in[21] , 1'b1};
                d_k_out_7= {d_k_in[6] , d_k_in[14] , d_k_in[22] , 1'b1};
                d_k_out_8= {d_k_in[7] , d_k_in[15] , d_k_in[23] , 1'b1};                 
            end 
            else if(data_valid[28] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[71:64] , data[135:128] , data[199:192]};
                        dataout_2= {data[15:8] , data[79:72] , data[143:136] , data[207:200]}; 
                        dataout_3= {data[23:16] , data[87:80] , data[151:144] , data[215:208]};
                        dataout_4= {data[31:24] , data[95:88] , data[159:152] , data[223:216]};
                        dataout_5= {data[39:32] , data[103:96] , data[167:160] , 8'b0};
                        dataout_6= {data[47:40] , data[111:104] , data[175:168] , 8'b0}; 
                        dataout_7= {data[55:48] , data[119:112] , data[183:176] , 8'b0};
                        dataout_8= {data[63:56] , data[127:120] , data[191:184] , 8'b0};             
                    end
                    else begin
                        dataout_1= {data[7:0] , data[71:64] , data[135:128] , data[199:192]};
                        dataout_2= {data[15:8] , data[79:72] , data[143:136] , data[207:200]}; 
                        dataout_3= {data[23:16] , data[87:80] , data[151:144] , data[215:208]};
                        dataout_4= {data[31:24] , data[95:88] , data[159:152] , data[223:216]};
                        dataout_5= {data[39:32] , data[103:96] , data[167:160] , 8'hf7};
                        dataout_6= {data[47:40] , data[111:104] , data[175:168] , 8'hf7}; 
                        dataout_7= {data[55:48] , data[119:112] , data[183:176] , 8'hf7};
                        dataout_8= {data[63:56] , data[127:120] , data[191:184] , 8'hf7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[8] , d_k_in[16] , d_k_in[24]};
                d_k_out_2= {d_k_in[1] , d_k_in[9] , d_k_in[17] , d_k_in[25]};
                d_k_out_3= {d_k_in[2] , d_k_in[10] , d_k_in[18] , d_k_in[26]};
                d_k_out_4= {d_k_in[3] , d_k_in[11] , d_k_in[19] , d_k_in[27]};
                d_k_out_5= {d_k_in[4] , d_k_in[12] , d_k_in[20] , 1'b1};
                d_k_out_6= {d_k_in[5] , d_k_in[13] , d_k_in[21] , 1'b1};
                d_k_out_7= {d_k_in[6] , d_k_in[14] , d_k_in[22] , 1'b1};
                d_k_out_8= {d_k_in[7] , d_k_in[15] , d_k_in[23] , 1'b1};                 
            end 
  end

  else if (pipe_width == 8 && number_of_lanes == 16) begin

                data_valid_out_1= 1'b1;
                data_valid_out_2= 1'b1;
                data_valid_out_3= 1'b1;
                data_valid_out_4= 1'b1;
                data_valid_out_5= 1'b1;
                data_valid_out_6= 1'b1;
                data_valid_out_7= 1'b1;
                data_valid_out_8= 1'b1;
                data_valid_out_9= 1'b1;
                data_valid_out_10= 1'b1;
                data_valid_out_11= 1'b1;
                data_valid_out_12= 1'b1;
                data_valid_out_13= 1'b1;
                data_valid_out_14= 1'b1;
                data_valid_out_15= 1'b1;
                data_valid_out_16= 1'b1;

            if(data_valid[15] == 1 && data_valid[0] == 1) begin
                dataout_1= data[7:0];
                dataout_2= data[15:8]; 
                dataout_3= data[23:16];
                dataout_4= data[31:24];
                dataout_5= data[39:32];
                dataout_6= data[47:40]; 
                dataout_7= data[55:48];
                dataout_8= data[63:56];
                dataout_9= data[71:64];
                dataout_10= data[79:72]; 
                dataout_11= data[87:80];
                dataout_12= data[95:88];
                dataout_13= data[103:96];
                dataout_14= data[111:104]; 
                dataout_15= data[119:112];
                dataout_16= data[127:120];

                d_k_out_1= d_k_in[0];
                d_k_out_2= d_k_in[1];
                d_k_out_3= d_k_in[2];
                d_k_out_4= d_k_in[3];
                d_k_out_5= d_k_in[4];
                d_k_out_6= d_k_in[5];
                d_k_out_7= d_k_in[6];
                d_k_out_8= d_k_in[7];
                d_k_out_9= d_k_in[8];
                d_k_out_10= d_k_in[9];
                d_k_out_11= d_k_in[10];
                d_k_out_12= d_k_in[11];
                d_k_out_13= d_k_in[12];
                d_k_out_14= d_k_in[13];
                d_k_out_15= d_k_in[14];
                d_k_out_16= d_k_in[15];   
            end
            else if(data_valid[4] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= data[7:0];
                        dataout_2= data[15:8]; 
                        dataout_3= data[23:16];
                        dataout_4= data[31:24];
                        dataout_5= 8'b0;
                        dataout_6= 8'b0; 
                        dataout_7= 8'b0;
                        dataout_8= 8'b0;
                        dataout_9= 8'b0;
                        dataout_10= 8'b0; 
                        dataout_11= 8'b0;
                        dataout_12= 8'b0;
                        dataout_13= 8'b0;
                        dataout_14= 8'b0; 
                        dataout_15= 8'b0;
                        dataout_16= 8'b0;     
                    end
                    else begin
                        dataout_1= data[7:0];
                        dataout_2= data[15:8]; 
                        dataout_3= data[23:16];
                        dataout_4= data[31:24];
                        dataout_5= 8'hf7;
                        dataout_6= 8'hf7; 
                        dataout_7= 8'hf7;
                        dataout_8= 8'hf7;
                        dataout_9= 8'hf7;
                        dataout_10= 8'hf7; 
                        dataout_11= 8'hf7;
                        dataout_12= 8'hf7;
                        dataout_13= 8'hf7;
                        dataout_14= 8'hf7; 
                        dataout_15= 8'hf7;
                        dataout_16= 8'hf7;                        
                    end


                d_k_out_1= d_k_in[0];
                d_k_out_2= d_k_in[1];
                d_k_out_3= d_k_in[2];
                d_k_out_4= d_k_in[3];
                d_k_out_5= 1;
                d_k_out_6= 1;
                d_k_out_7= 1;
                d_k_out_8= 1;
                d_k_out_9= 1;
                d_k_out_10= 1;
                d_k_out_11= 1;
                d_k_out_12= 1;
                d_k_out_13= 1;
                d_k_out_14= 1;
                d_k_out_15= 1;
                d_k_out_16= 1;   
            end            
            else if(data_valid[8] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= data[7:0];
                        dataout_2= data[15:8]; 
                        dataout_3= data[23:16];
                        dataout_4= data[31:24];
                        dataout_5= data[39:32];
                        dataout_6= data[47:40]; 
                        dataout_7= data[55:48];
                        dataout_8= data[63:56];
                        dataout_9= 8'b0;
                        dataout_10= 8'b0; 
                        dataout_11= 8'b0;
                        dataout_12= 8'b0;
                        dataout_13= 8'b0;
                        dataout_14= 8'b0; 
                        dataout_15= 8'b0;
                        dataout_16= 8'b0;          
                    end
                    else begin
                        dataout_1= data[7:0];
                        dataout_2= data[15:8]; 
                        dataout_3= data[23:16];
                        dataout_4= data[31:24];
                        dataout_5= data[39:32];
                        dataout_6= data[47:40]; 
                        dataout_7= data[55:48];
                        dataout_8= data[63:56];
                        dataout_9= 8'hf7;
                        dataout_10= 8'hf7; 
                        dataout_11= 8'hf7;
                        dataout_12= 8'hf7;
                        dataout_13= 8'hf7;
                        dataout_14= 8'hf7; 
                        dataout_15= 8'hf7;
                        dataout_16= 8'hf7;                        
                    end


                d_k_out_1= d_k_in[0];
                d_k_out_2= d_k_in[1];
                d_k_out_3= d_k_in[2];
                d_k_out_4= d_k_in[3];
                d_k_out_5= d_k_in[4];
                d_k_out_6= d_k_in[5];
                d_k_out_7= d_k_in[6];
                d_k_out_8= d_k_in[7];
                d_k_out_9= 1;
                d_k_out_10= 1;
                d_k_out_11= 1;
                d_k_out_12= 1;
                d_k_out_13= 1;
                d_k_out_14= 1;
                d_k_out_15= 1;
                d_k_out_16= 1;   
            end
            else if(data_valid[12] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= data[7:0];
                        dataout_2= data[15:8]; 
                        dataout_3= data[23:16];
                        dataout_4= data[31:24];
                        dataout_5= data[39:32];
                        dataout_6= data[47:40]; 
                        dataout_7= data[55:48];
                        dataout_8= data[63:56];
                        dataout_9= data[71:64];
                        dataout_10= data[79:72]; 
                        dataout_11= data[87:80];
                        dataout_12= data[95:88];
                        dataout_13= 8'b0;
                        dataout_14= 8'b0; 
                        dataout_15= 8'b0;
                        dataout_16= 8'b0;       
                    end
                    else begin
                        dataout_1= data[7:0];
                        dataout_2= data[15:8]; 
                        dataout_3= data[23:16];
                        dataout_4= data[31:24];
                        dataout_5= data[39:32];
                        dataout_6= data[47:40]; 
                        dataout_7= data[55:48];
                        dataout_8= data[63:56];
                        dataout_9= data[71:64];
                        dataout_10= data[79:72]; 
                        dataout_11= data[87:80];
                        dataout_12= data[95:88];
                        dataout_13= 8'hf7;
                        dataout_14= 8'hf7; 
                        dataout_15= 8'hf7;
                        dataout_16= 8'hf7;                        
                    end


                d_k_out_1= d_k_in[0];
                d_k_out_2= d_k_in[1];
                d_k_out_3= d_k_in[2];
                d_k_out_4= d_k_in[3];
                d_k_out_5= d_k_in[4];
                d_k_out_6= d_k_in[5];
                d_k_out_7= d_k_in[6];
                d_k_out_8= d_k_in[7];
                d_k_out_9= d_k_in[8];
                d_k_out_10= d_k_in[9];
                d_k_out_11= d_k_in[10];
                d_k_out_12= d_k_in[11];
                d_k_out_13= 1;
                d_k_out_14= 1;
                d_k_out_15= 1;
                d_k_out_16= 1;   
            end

  end

  else if (pipe_width == 16 && number_of_lanes == 16) begin

                data_valid_out_1= 1'b1;
                data_valid_out_2= 1'b1;
                data_valid_out_3= 1'b1;
                data_valid_out_4= 1'b1;
                data_valid_out_5= 1'b1;
                data_valid_out_6= 1'b1;
                data_valid_out_7= 1'b1;
                data_valid_out_8= 1'b1;
                data_valid_out_9= 1'b1;
                data_valid_out_10= 1'b1;
                data_valid_out_11= 1'b1;
                data_valid_out_12= 1'b1;
                data_valid_out_13= 1'b1;
                data_valid_out_14= 1'b1;
                data_valid_out_15= 1'b1;
                data_valid_out_16= 1'b1; 

            if(data_valid[31] == 1 && data_valid[0] == 1) begin
                dataout_1= {data[7:0] , data[135:128]};
                dataout_2= {data[15:8] , data[143:136]}; 
                dataout_3= {data[23:16] , data[151:144]};
                dataout_4= {data[31:24] , data[159:152]};
                dataout_5= {data[39:32] , data[167:160]};
                dataout_6= {data[47:40] , data[175:168]}; 
                dataout_7= {data[55:48] , data[183:176]};
                dataout_8= {data[63:56] , data[191:184]};
                dataout_9= {data[71:64] , data[199:192]};
                dataout_10= {data[79:72] , data[207:200]}; 
                dataout_11= {data[87:80] , data[215:208]};
                dataout_12= {data[95:88] , data[223:216]};
                dataout_13= {data[103:96] , data[231:224]};
                dataout_14= {data[111:104] , data[239:232]};
                dataout_15= {data[119:112] , data[247:240]};
                dataout_16= {data[127:120] , data[255:248]};

                d_k_out_1= {d_k_in[0] , d_k_in[16]};
                d_k_out_2= {d_k_in[1] , d_k_in[17]};
                d_k_out_3= {d_k_in[2] , d_k_in[18]};
                d_k_out_4= {d_k_in[3] , d_k_in[19]};
                d_k_out_5= {d_k_in[4] , d_k_in[20]};
                d_k_out_6= {d_k_in[5] , d_k_in[21]};
                d_k_out_7= {d_k_in[6] , d_k_in[22]};
                d_k_out_8= {d_k_in[7] , d_k_in[23]};
                d_k_out_9= {d_k_in[8] , d_k_in[24]};
                d_k_out_10= {d_k_in[9] , d_k_in[25]};
                d_k_out_11= {d_k_in[10] , d_k_in[26]};
                d_k_out_12= {d_k_in[11] , d_k_in[27]};
                d_k_out_13= {d_k_in[12] , d_k_in[28]};
                d_k_out_14= {d_k_in[13] , d_k_in[29]};
                d_k_out_15= {d_k_in[14] , d_k_in[30]};
                d_k_out_16= {d_k_in[15] , d_k_in[31]};                
            end
           else if(data_valid[4] == 0 && data_valid[0] == 1) begin
                if(generation>=3) begin
                        dataout_1= {data[7:0] , 8'b0};
                        dataout_2= {data[15:8] , 8'b0}; 
                        dataout_3= {data[23:16] , 8'b0};
                        dataout_4= {data[31:24] , 8'b0};
                        dataout_5= {16'b0};
                        dataout_6= {16'b0}; 
                        dataout_7= {16'b0};
                        dataout_8= {16'b0};
                        dataout_9= {16'b0};
                        dataout_10= {16'b0}; 
                        dataout_11= {16'b0};
                        dataout_12= {16'b0};
                        dataout_13= {16'b0};
                        dataout_14= {16'b0};
                        dataout_15= {16'b0};
                        dataout_16= {16'b0};               
                end
                else begin
                        dataout_1= {data[7:0] , 8'hf7};
                        dataout_2= {data[15:8] , 8'hf7}; 
                        dataout_3= {data[23:16] , 8'hf7};
                        dataout_4= {data[31:24] , 8'hf7};
                        dataout_5= {16'hf7f7};
                        dataout_6= {16'hf7f7}; 
                        dataout_7= {16'hf7f7};
                        dataout_8= {16'hf7f7};
                        dataout_9= {16'hf7f7};
                        dataout_10= {16'hf7f7}; 
                        dataout_11= {16'hf7f7};
                        dataout_12= {16'hf7f7};
                        dataout_13= {16'hf7f7};
                        dataout_14= {16'hf7f7};
                        dataout_15= {16'hf7f7};
                        dataout_16= {16'hf7f7};                    
                end


                d_k_out_1= {d_k_in[0] , 1'b1};
                d_k_out_2= {d_k_in[1] , 1'b1};
                d_k_out_3= {d_k_in[2] , 1'b1};
                d_k_out_4= {d_k_in[3] , 1'b1};
                d_k_out_5= 2'b11;
                d_k_out_6= 2'b11;
                d_k_out_7= 2'b11;
                d_k_out_8= 2'b11;
                d_k_out_9= 2'b11;
                d_k_out_10= 2'b11;
                d_k_out_11= 2'b11;
                d_k_out_12= 2'b11;
                d_k_out_13= 2'b11;
                d_k_out_14= 2'b11;
                d_k_out_15= 2'b11;
                d_k_out_16= 2'b11;                
            end             
            else if(data_valid[8] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , 8'b0};
                        dataout_2= {data[15:8] , 8'b0}; 
                        dataout_3= {data[23:16] , 8'b0};
                        dataout_4= {data[31:24] , 8'b0};
                        dataout_5= {data[39:32] , 8'b0};
                        dataout_6= {data[47:40] , 8'b0}; 
                        dataout_7= {data[55:48] , 8'b0};
                        dataout_8= {data[63:56] , 8'b0};
                        dataout_9= {16'b0};
                        dataout_10=  {16'b0}; 
                        dataout_11=  {16'b0};
                        dataout_12=  {16'b0};
                        dataout_13=  {16'b0};
                        dataout_14=  {16'b0};
                        dataout_15=  {16'b0};
                        dataout_16=  {16'b0};     
                    end
                    else begin
                        dataout_1= {data[7:0] , 8'hf7};
                        dataout_2= {data[15:8] , 8'hf7}; 
                        dataout_3= {data[23:16] , 8'hf7};
                        dataout_4= {data[31:24] , 8'hf7};
                        dataout_5= {data[39:32] , 8'hf7};
                        dataout_6= {data[47:40] , 8'hf7}; 
                        dataout_7= {data[55:48] , 8'hf7};
                        dataout_8= {data[63:56] , 8'hf7};
                        dataout_9= {16'hf7f7};
                        dataout_10=  {16'hf7f7}; 
                        dataout_11=  {16'hf7f7};
                        dataout_12=  {16'hf7f7};
                        dataout_13=  {16'hf7f7};
                        dataout_14=  {16'hf7f7};
                        dataout_15=  {16'hf7f7};
                        dataout_16=  {16'hf7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , 1'b1};
                d_k_out_2= {d_k_in[1] , 1'b1};
                d_k_out_3= {d_k_in[2] , 1'b1};
                d_k_out_4= {d_k_in[3] , 1'b1};
                d_k_out_5= {d_k_in[4] , 1'b1};
                d_k_out_6= {d_k_in[5] , 1'b1};
                d_k_out_7= {d_k_in[6] , 1'b1};
                d_k_out_8= {d_k_in[7] , 1'b1};
                d_k_out_9=  2'b11;
                d_k_out_10=  2'b11;
                d_k_out_11=  2'b11;
                d_k_out_12=  2'b11;
                d_k_out_13=  2'b11;
                d_k_out_14=  2'b11;
                d_k_out_15=  2'b11;
                d_k_out_16=  2'b11;                
            end             
            else if(data_valid[12] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , 8'b0};
                        dataout_2= {data[15:8] , 8'b0}; 
                        dataout_3= {data[23:16] , 8'b0};
                        dataout_4= {data[31:24] , 8'b0};
                        dataout_5= {data[39:32] , 8'b0};
                        dataout_6= {data[47:40] , 8'b0}; 
                        dataout_7= {data[55:48] , 8'b0};
                        dataout_8= {data[63:56] , 8'b0};
                        dataout_9= {data[71:64] , 8'b0};
                        dataout_10= {data[79:72] , 8'b0}; 
                        dataout_11= {data[87:80] , 8'b0};
                        dataout_12= {data[95:88] , 8'b0};
                        dataout_13=  {16'b0};
                        dataout_14=  {16'b0};
                        dataout_15=  {16'b0};
                        dataout_16=  {16'b0};   
                    end
                    else begin
                        dataout_1= {data[7:0] , 8'hf7};
                        dataout_2= {data[15:8] , 8'hf7}; 
                        dataout_3= {data[23:16] , 8'hf7};
                        dataout_4= {data[31:24] , 8'hf7};
                        dataout_5= {data[39:32] , 8'hf7};
                        dataout_6= {data[47:40] , 8'hf7}; 
                        dataout_7= {data[55:48] , 8'hf7};
                        dataout_8= {data[63:56] , 8'hf7};
                        dataout_9= {data[71:64] , 8'hf7};
                        dataout_10= {data[79:72] , 8'hf7}; 
                        dataout_11= {data[87:80] , 8'hf7};
                        dataout_12= {data[95:88] , 8'hf7};
                        dataout_13=  {16'hf7f7};
                        dataout_14=  {16'hf7f7};
                        dataout_15=  {16'hf7f7};
                        dataout_16=  {16'hf7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , 1'b1};
                d_k_out_2= {d_k_in[1] , 1'b1};
                d_k_out_3= {d_k_in[2] , 1'b1};
                d_k_out_4= {d_k_in[3] , 1'b1};
                d_k_out_5= {d_k_in[4] , 1'b1};
                d_k_out_6= {d_k_in[5] , 1'b1};
                d_k_out_7= {d_k_in[6] , 1'b1};
                d_k_out_8= {d_k_in[7] , 1'b1};
                d_k_out_9= {d_k_in[8] , 1'b1};
                d_k_out_10= {d_k_in[9] , 1'b1};
                d_k_out_11= {d_k_in[10] , 1'b1};
                d_k_out_12= {d_k_in[11] , 1'b1};
                d_k_out_13=  2'b11;
                d_k_out_14=  2'b11;
                d_k_out_15=  2'b11;
                d_k_out_16=  2'b11;                
            end                        
            else if(data_valid[16] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , 8'b0};
                        dataout_2= {data[15:8] , 8'b0}; 
                        dataout_3= {data[23:16] ,8'b0};
                        dataout_4= {data[31:24] , 8'b0};
                        dataout_5= {data[39:32] , 8'b0};
                        dataout_6= {data[47:40] , 8'b0}; 
                        dataout_7= {data[55:48] , 8'b0};
                        dataout_8= {data[63:56] , 8'b0};
                        dataout_9= {data[71:64] , 8'b0};
                        dataout_10= {data[79:72] , 8'b0}; 
                        dataout_11= {data[87:80] , 8'b0};
                        dataout_12= {data[95:88] , 8'b0};
                        dataout_13= {data[103:96] , 8'b0};
                        dataout_14= {data[111:104] , 8'b0};
                        dataout_15= {data[119:112] , 8'b0};
                        dataout_16= {data[127:120] , 8'b0};
                    end
                    else begin
                        dataout_1= {data[7:0] , 8'hf7};
                        dataout_2= {data[15:8] , 8'hf7}; 
                        dataout_3= {data[23:16] ,8'hf7};
                        dataout_4= {data[31:24] , 8'hf7};
                        dataout_5= {data[39:32] , 8'hf7};
                        dataout_6= {data[47:40] , 8'hf7}; 
                        dataout_7= {data[55:48] , 8'hf7};
                        dataout_8= {data[63:56] , 8'hf7};
                        dataout_9= {data[71:64] , 8'hf7};
                        dataout_10= {data[79:72] , 8'hf7}; 
                        dataout_11= {data[87:80] , 8'hf7};
                        dataout_12= {data[95:88] , 8'hf7};
                        dataout_13= {data[103:96] , 8'hf7};
                        dataout_14= {data[111:104] , 8'hf7};
                        dataout_15= {data[119:112] , 8'hf7};
                        dataout_16= {data[127:120] , 8'hf7};                        
                    end


                d_k_out_1= {d_k_in[0] , 1'b1};
                d_k_out_2= {d_k_in[1] , 1'b1};
                d_k_out_3= {d_k_in[2] , 1'b1};
                d_k_out_4= {d_k_in[3] , 1'b1};
                d_k_out_5= {d_k_in[4] , 1'b1};
                d_k_out_6= {d_k_in[5] , 1'b1};
                d_k_out_7= {d_k_in[6] , 1'b1};
                d_k_out_8= {d_k_in[7] , 1'b1};
                d_k_out_9= {d_k_in[8] , 1'b1};
                d_k_out_10= {d_k_in[9] , 1'b1};
                d_k_out_11= {d_k_in[10] , 1'b1};
                d_k_out_12= {d_k_in[11] , 1'b1};
                d_k_out_13= {d_k_in[12] , 1'b1};
                d_k_out_14= {d_k_in[13] , 1'b1};
                d_k_out_15= {d_k_in[14] , 1'b1};
                d_k_out_16= {d_k_in[15] , 1'b1};                
            end            
            else if(data_valid[20] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[135:128]};
                        dataout_2= {data[15:8] , data[143:136]}; 
                        dataout_3= {data[23:16] , data[151:144]};
                        dataout_4= {data[31:24] , data[159:152]};
                        dataout_5= {data[39:32] , 8'b0};
                        dataout_6= {data[47:40] , 8'b0}; 
                        dataout_7= {data[55:48] , 8'b0};
                        dataout_8= {data[63:56] , 8'b0};
                        dataout_9= {data[71:64] , 8'b0};
                        dataout_10= {data[79:72] , 8'b0}; 
                        dataout_11= {data[87:80] , 8'b0};
                        dataout_12= {data[95:88] , 8'b0};
                        dataout_13= {data[103:96] , 8'b0};
                        dataout_14= {data[111:104] , 8'b0};
                        dataout_15= {data[119:112] , 8'b0};
                        dataout_16= {data[127:120] , 8'b0};         
                    end
                    else begin
                        dataout_1= {data[7:0] , data[135:128]};
                        dataout_2= {data[15:8] , data[143:136]}; 
                        dataout_3= {data[23:16] , data[151:144]};
                        dataout_4= {data[31:24] , data[159:152]};
                        dataout_5= {data[39:32] , 8'hf7};
                        dataout_6= {data[47:40] , 8'hf7}; 
                        dataout_7= {data[55:48] , 8'hf7};
                        dataout_8= {data[63:56] , 8'hf7};
                        dataout_9= {data[71:64] , 8'hf7};
                        dataout_10= {data[79:72] , 8'hf7}; 
                        dataout_11= {data[87:80] , 8'hf7};
                        dataout_12= {data[95:88] , 8'hf7};
                        dataout_13= {data[103:96] , 8'hf7};
                        dataout_14= {data[111:104] , 8'hf7};
                        dataout_15= {data[119:112] , 8'hf7};
                        dataout_16= {data[127:120] , 8'hf7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[16]};
                d_k_out_2= {d_k_in[1] , d_k_in[17]};
                d_k_out_3= {d_k_in[2] , d_k_in[18]};
                d_k_out_4= {d_k_in[3] , d_k_in[19]};
                d_k_out_5= {d_k_in[4] , 1'b1};
                d_k_out_6= {d_k_in[5] , 1'b1};
                d_k_out_7= {d_k_in[6] , 1'b1};
                d_k_out_8= {d_k_in[7] , 1'b1};
                d_k_out_9= {d_k_in[8] , 1'b1};
                d_k_out_10= {d_k_in[9] , 1'b1};
                d_k_out_11= {d_k_in[10] , 1'b1};
                d_k_out_12= {d_k_in[11] , 1'b1};
                d_k_out_13= {d_k_in[12] , 1'b1};
                d_k_out_14= {d_k_in[13] , 1'b1};
                d_k_out_15= {d_k_in[14] , 1'b1};
                d_k_out_16= {d_k_in[15] , 1'b1};                
            end                        
            else if(data_valid[24] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[135:128]};
                        dataout_2= {data[15:8] , data[143:136]}; 
                        dataout_3= {data[23:16] , data[151:144]};
                        dataout_4= {data[31:24] , data[159:152]};
                        dataout_5= {data[39:32] , data[167:160]};
                        dataout_6= {data[47:40] , data[175:168]}; 
                        dataout_7= {data[55:48] , data[183:176]};
                        dataout_8= {data[63:56] , data[191:184]};
                        dataout_9= {data[71:64] , 8'b0};
                        dataout_10= {data[79:72] , 8'b0}; 
                        dataout_11= {data[87:80] , 8'b0};
                        dataout_12= {data[95:88] , 8'b0};
                        dataout_13= {data[103:96] , 8'b0};
                        dataout_14= {data[111:104] , 8'b0};
                        dataout_15= {data[119:112] , 8'b0};
                        dataout_16= {data[127:120] , 8'b0};
                    end
                    else begin
                        dataout_1= {data[7:0] , data[135:128]};
                        dataout_2= {data[15:8] , data[143:136]}; 
                        dataout_3= {data[23:16] , data[151:144]};
                        dataout_4= {data[31:24] , data[159:152]};
                        dataout_5= {data[39:32] , data[167:160]};
                        dataout_6= {data[47:40] , data[175:168]}; 
                        dataout_7= {data[55:48] , data[183:176]};
                        dataout_8= {data[63:56] , data[191:184]};
                        dataout_9= {data[71:64] , 8'hf7};
                        dataout_10= {data[79:72] , 8'hf7}; 
                        dataout_11= {data[87:80] , 8'hf7};
                        dataout_12= {data[95:88] , 8'hf7};
                        dataout_13= {data[103:96] , 8'hf7};
                        dataout_14= {data[111:104] , 8'hf7};
                        dataout_15= {data[119:112] , 8'hf7};
                        dataout_16= {data[127:120] , 8'hf7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[16]};
                d_k_out_2= {d_k_in[1] , d_k_in[17]};
                d_k_out_3= {d_k_in[2] , d_k_in[18]};
                d_k_out_4= {d_k_in[3] , d_k_in[19]};
                d_k_out_5= {d_k_in[4] , d_k_in[20]};
                d_k_out_6= {d_k_in[5] , d_k_in[21]};
                d_k_out_7= {d_k_in[6] , d_k_in[22]};
                d_k_out_8= {d_k_in[7] , d_k_in[23]};
                d_k_out_9= {d_k_in[8] , 1'b1};
                d_k_out_10= {d_k_in[9] , 1'b1};
                d_k_out_11= {d_k_in[10] , 1'b1};
                d_k_out_12= {d_k_in[11] , 1'b1};
                d_k_out_13= {d_k_in[12] , 1'b1};
                d_k_out_14= {d_k_in[13] , 1'b1};
                d_k_out_15= {d_k_in[14] , 1'b1};
                d_k_out_16= {d_k_in[15] , 1'b1};                
            end            
            else if(data_valid[28] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[135:128]};
                        dataout_2= {data[15:8] , data[143:136]}; 
                        dataout_3= {data[23:16] , data[151:144]};
                        dataout_4= {data[31:24] , data[159:152]};
                        dataout_5= {data[39:32] , data[167:160]};
                        dataout_6= {data[47:40] , data[175:168]}; 
                        dataout_7= {data[55:48] , data[183:176]};
                        dataout_8= {data[63:56] , data[191:184]};
                        dataout_9= {data[71:64] , data[199:192]};
                        dataout_10= {data[79:72] , data[207:200]}; 
                        dataout_11= {data[87:80] , data[215:208]};
                        dataout_12= {data[95:88] , data[223:216]};
                        dataout_13= {data[103:96] , 8'b0};
                        dataout_14= {data[111:104] , 8'b0};
                        dataout_15= {data[119:112] , 8'b0};
                        dataout_16= {data[127:120] , 8'b0};
                    end
                    else begin
                        dataout_1= {data[7:0] , data[135:128]};
                        dataout_2= {data[15:8] , data[143:136]}; 
                        dataout_3= {data[23:16] , data[151:144]};
                        dataout_4= {data[31:24] , data[159:152]};
                        dataout_5= {data[39:32] , data[167:160]};
                        dataout_6= {data[47:40] , data[175:168]}; 
                        dataout_7= {data[55:48] , data[183:176]};
                        dataout_8= {data[63:56] , data[191:184]};
                        dataout_9= {data[71:64] , data[199:192]};
                        dataout_10= {data[79:72] , data[207:200]}; 
                        dataout_11= {data[87:80] , data[215:208]};
                        dataout_12= {data[95:88] , data[223:216]};
                        dataout_13= {data[103:96] , 8'hf7};
                        dataout_14= {data[111:104] , 8'hf7};
                        dataout_15= {data[119:112] , 8'hf7};
                        dataout_16= {data[127:120] , 8'hf7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[16]};
                d_k_out_2= {d_k_in[1] , d_k_in[17]};
                d_k_out_3= {d_k_in[2] , d_k_in[18]};
                d_k_out_4= {d_k_in[3] , d_k_in[19]};
                d_k_out_5= {d_k_in[4] , d_k_in[20]};
                d_k_out_6= {d_k_in[5] , d_k_in[21]};
                d_k_out_7= {d_k_in[6] , d_k_in[22]};
                d_k_out_8= {d_k_in[7] , d_k_in[23]};
                d_k_out_9= {d_k_in[8] , d_k_in[24]};
                d_k_out_10= {d_k_in[9] , d_k_in[25]};
                d_k_out_11= {d_k_in[10] , d_k_in[26]};
                d_k_out_12= {d_k_in[11] , d_k_in[27]};
                d_k_out_13= {d_k_in[12] , 1'b1};
                d_k_out_14= {d_k_in[13] , 1'b1};
                d_k_out_15= {d_k_in[14] , 1'b1};
                d_k_out_16= {d_k_in[15] , 1'b1};                
            end
  end

  else if (pipe_width == 32 && number_of_lanes == 16) begin

                data_valid_out_1= 1'b1;
                data_valid_out_2= 1'b1;
                data_valid_out_3= 1'b1;
                data_valid_out_4= 1'b1;
                data_valid_out_5= 1'b1;
                data_valid_out_6= 1'b1;
                data_valid_out_7= 1'b1;
                data_valid_out_8= 1'b1;
                data_valid_out_9= 1'b1;
                data_valid_out_10= 1'b1;
                data_valid_out_11= 1'b1;
                data_valid_out_12= 1'b1;
                data_valid_out_13= 1'b1;
                data_valid_out_14= 1'b1;
                data_valid_out_15= 1'b1;
                data_valid_out_16= 1'b1;
  
            if(data_valid[63] == 1 && data_valid[0] == 1) begin
                dataout_1= {data[7:0] , data[135:128] , data[263:256] , data[391:384]};
                dataout_2= {data[15:8] , data[143:136] , data[271:264] , data[399:392]}; 
                dataout_3= {data[23:16] , data[151:144] , data[279:272] , data[407:400]};
                dataout_4= {data[31:24] , data[159:152] , data[287:280] , data[415:408]};
                dataout_5= {data[39:32] , data[167:160] , data[295:288] , data[423:416]};
                dataout_6= {data[47:40] , data[175:168] , data[303:296] , data[431:424]}; 
                dataout_7= {data[55:48] , data[183:176] , data[311:304] , data[439:432]};
                dataout_8= {data[63:56] , data[191:184] , data[319:312] , data[447:440]};
                dataout_9= {data[71:64] , data[199:192] , data[327:320] , data[455:448]};
                dataout_10= {data[79:72] , data[207:200] , data[335:328] , data[463:456]}; 
                dataout_11= {data[87:80] , data[215:208] , data[343:336] , data[471:464]};
                dataout_12= {data[95:88] , data[223:216] , data[351:344] , data[479:472]};
                dataout_13= {data[103:96] , data[231:224] , data[359:352] , data[487:480]};
                dataout_14= {data[111:104] , data[239:232] , data[367:360] , data[495:488]}; 
                dataout_15= {data[119:112] , data[247:240] , data[375:368] , data[503:496]};
                dataout_16= {data[127:120] , data[255:248] , data[383:376] , data[511:504]};

                d_k_out_1= {d_k_in[0] , d_k_in[16] , d_k_in[32] , d_k_in[48]};
                d_k_out_2= {d_k_in[1] , d_k_in[17] , d_k_in[33] , d_k_in[49]};
                d_k_out_3= {d_k_in[2] , d_k_in[18] , d_k_in[34] , d_k_in[50]};
                d_k_out_4= {d_k_in[3] , d_k_in[19] , d_k_in[35] , d_k_in[51]};
                d_k_out_5= {d_k_in[4] , d_k_in[20] , d_k_in[36] , d_k_in[52]};
                d_k_out_6= {d_k_in[5] , d_k_in[21] , d_k_in[37] , d_k_in[53]};
                d_k_out_7= {d_k_in[6] , d_k_in[22] , d_k_in[38] , d_k_in[54]};
                d_k_out_8= {d_k_in[7] , d_k_in[23] , d_k_in[39] , d_k_in[55]};
                d_k_out_9= {d_k_in[8] , d_k_in[24] , d_k_in[40] , d_k_in[56]};
                d_k_out_10= {d_k_in[9] , d_k_in[25] , d_k_in[41] , d_k_in[57]};
                d_k_out_11= {d_k_in[10] , d_k_in[26] , d_k_in[42] , d_k_in[58]};
                d_k_out_12= {d_k_in[11] , d_k_in[27] , d_k_in[43] , d_k_in[59]};
                d_k_out_13= {d_k_in[12] , d_k_in[28] , d_k_in[44] , d_k_in[60]};
                d_k_out_14= {d_k_in[13] , d_k_in[29] , d_k_in[45] , d_k_in[61]};
                d_k_out_15= {d_k_in[14] , d_k_in[30] , d_k_in[46] , d_k_in[62]};
                d_k_out_16= {d_k_in[15] , d_k_in[31] , d_k_in[47] , d_k_in[63]};
            end
            else if(data_valid[4] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , 24'b0};
                        dataout_2= {data[15:8] , 24'b0}; 
                        dataout_3= {data[23:16] , 24'b0};
                        dataout_4= {data[31:24] , 24'b0};
                        dataout_5= {32'b0};
                        dataout_6= {32'b0}; 
                        dataout_7= {32'b0};
                        dataout_8= {32'b0};
                        dataout_9= {32'b0};
                        dataout_10= {32'b0};
                        dataout_11= {32'b0};
                        dataout_12= {32'b0};
                        dataout_13= {32'b0};
                        dataout_14= {32'b0};
                        dataout_15= {32'b0};
                        dataout_16= {32'b0};
                    end
                    else begin
                        dataout_1= {data[7:0] , 24'hf7f7f7};
                        dataout_2= {data[15:8] , 24'hf7f7f7}; 
                        dataout_3= {data[23:16] , 24'hf7f7f7};
                        dataout_4= {data[31:24] , 24'hf7f7f7};
                        dataout_5= {32'hf7f7f7f7};
                        dataout_6= {32'hf7f7f7f7}; 
                        dataout_7= {32'hf7f7f7f7};
                        dataout_8= {32'hf7f7f7f7};
                        dataout_9= {32'hf7f7f7f7};
                        dataout_10= {32'hf7f7f7f7};
                        dataout_11= {32'hf7f7f7f7};
                        dataout_12= {32'hf7f7f7f7};
                        dataout_13= {32'hf7f7f7f7};
                        dataout_14= {32'hf7f7f7f7};
                        dataout_15= {32'hf7f7f7f7};
                        dataout_16= {32'hf7f7f7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , 3'b111};
                d_k_out_2= {d_k_in[1] , 3'b111};
                d_k_out_3= {d_k_in[2] , 3'b111};
                d_k_out_4= {d_k_in[3] , 3'b111};
                d_k_out_5=  4'b1111;
                d_k_out_6=  4'b1111;
                d_k_out_7=  4'b1111;
                d_k_out_8=  4'b1111;
                d_k_out_9=  4'b1111;
                d_k_out_10=  4'b1111;
                d_k_out_11=  4'b1111;
                d_k_out_12=  4'b1111;
                d_k_out_13=  4'b1111;
                d_k_out_14=  4'b1111;
                d_k_out_15=  4'b1111;
                d_k_out_16=  4'b1111;
            end
            else if(data_valid[8] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , 24'b0};
                        dataout_2= {data[15:8] , 24'b0}; 
                        dataout_3= {data[23:16] , 24'b0};
                        dataout_4= {data[31:24] , 24'b0};
                        dataout_5= {data[39:32] , 24'b0};
                        dataout_6= {data[47:40] , 24'b0}; 
                        dataout_7= {data[55:48] , 24'b0};
                        dataout_8= {data[63:56] , 24'b0};
                        dataout_9= {32'b0};
                        dataout_10=  {32'b0}; 
                        dataout_11=  {32'b0};
                        dataout_12=  {32'b0};
                        dataout_13=  {32'b0};
                        dataout_14=  {32'b0}; 
                        dataout_15=  {32'b0};
                        dataout_16=  {32'b0};            
                    end
                    else begin
                        dataout_1= {data[7:0] , 24'hf7f7f7};
                        dataout_2= {data[15:8] , 24'hf7f7f7}; 
                        dataout_3= {data[23:16] , 24'hf7f7f7};
                        dataout_4= {data[31:24] , 24'hf7f7f7};
                        dataout_5= {data[39:32] , 24'hf7f7f7};
                        dataout_6= {data[47:40] , 24'hf7f7f7}; 
                        dataout_7= {data[55:48] , 24'hf7f7f7};
                        dataout_8= {data[63:56] , 24'hf7f7f7};
                        dataout_9= {32'hf7f7f7f7};
                        dataout_10=  {32'hf7f7f7f7}; 
                        dataout_11=  {32'hf7f7f7f7};
                        dataout_12=  {32'hf7f7f7f7};
                        dataout_13=  {32'hf7f7f7f7};
                        dataout_14=  {32'hf7f7f7f7}; 
                        dataout_15=  {32'hf7f7f7f7};
                        dataout_16=  {32'hf7f7f7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , 3'b111};
                d_k_out_2= {d_k_in[1] , 3'b111};
                d_k_out_3= {d_k_in[2] , 3'b111};
                d_k_out_4= {d_k_in[3] , 3'b111};
                d_k_out_5= {d_k_in[4] , 3'b111};
                d_k_out_6= {d_k_in[5] , 3'b111};
                d_k_out_7= {d_k_in[6] , 3'b111};
                d_k_out_8= {d_k_in[7] , 3'b111};
                d_k_out_9=  4'b1111;
                d_k_out_10=  4'b1111;
                d_k_out_11=  4'b1111;
                d_k_out_12=  4'b1111;
                d_k_out_13=  4'b1111;
                d_k_out_14=  4'b1111;
                d_k_out_15=  4'b1111;
                d_k_out_16=  4'b1111;
            end
            else if(data_valid[12] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , 24'b0};
                        dataout_2= {data[15:8] , 24'b0}; 
                        dataout_3= {data[23:16] , 24'b0};
                        dataout_4= {data[31:24] , 24'b0};
                        dataout_5= {data[39:32] , 24'b0};
                        dataout_6= {data[47:40] , 24'b0}; 
                        dataout_7= {data[55:48] , 24'b0};
                        dataout_8= {data[63:56] , 24'b0};
                        dataout_9= {data[71:64] , 24'b0};
                        dataout_10= {data[79:72] , 24'b0}; 
                        dataout_11= {data[87:80] , 24'b0};
                        dataout_12= {data[95:88] , 24'b0};
                        dataout_13= {32'b0};
                        dataout_14= {32'b0}; 
                        dataout_15= {32'b0};
                        dataout_16= {32'b0}; 
                    end
                    else begin
                        dataout_1= {data[7:0] , 24'hf7f7f7};
                        dataout_2= {data[15:8] , 24'hf7f7f7}; 
                        dataout_3= {data[23:16] , 24'hf7f7f7};
                        dataout_4= {data[31:24] , 24'hf7f7f7};
                        dataout_5= {data[39:32] , 24'hf7f7f7};
                        dataout_6= {data[47:40] , 24'hf7f7f7}; 
                        dataout_7= {data[55:48] , 24'hf7f7f7};
                        dataout_8= {data[63:56] , 24'hf7f7f7};
                        dataout_9= {data[71:64] , 24'hf7f7f7};
                        dataout_10= {data[79:72] , 24'hf7f7f7}; 
                        dataout_11= {data[87:80] , 24'hf7f7f7};
                        dataout_12= {data[95:88] , 24'hf7f7f7};
                        dataout_13= {32'hf7f7f7f7};
                        dataout_14= {32'hf7f7f7f7}; 
                        dataout_15= {32'hf7f7f7f7};
                        dataout_16= {32'hf7f7f7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , 3'b111};
                d_k_out_2= {d_k_in[1] , 3'b111};
                d_k_out_3= {d_k_in[2] , 3'b111};
                d_k_out_4= {d_k_in[3] , 3'b111};
                d_k_out_5= {d_k_in[4] , 3'b111};
                d_k_out_6= {d_k_in[5] , 3'b111};
                d_k_out_7= {d_k_in[6] , 3'b111};
                d_k_out_8= {d_k_in[7] , 3'b111};
                d_k_out_9= {d_k_in[8] , 3'b111};
                d_k_out_10= {d_k_in[9] , 3'b111};
                d_k_out_11= {d_k_in[10] , 3'b111};
                d_k_out_12= {d_k_in[11] , 3'b111};
                d_k_out_13=  4'b1111;
                d_k_out_14=  4'b1111;
                d_k_out_15=  4'b1111;
                d_k_out_16=  4'b1111;
            end
            else if(data_valid[16] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , 24'b0};
                        dataout_2= {data[15:8] , 24'b0}; 
                        dataout_3= {data[23:16] , 24'b0};
                        dataout_4= {data[31:24] , 24'b0};
                        dataout_5= {data[39:32] , 24'b0};
                        dataout_6= {data[47:40] , 24'b0}; 
                        dataout_7= {data[55:48] , 24'b0};
                        dataout_8= {data[63:56] , 24'b0};
                        dataout_9= {data[71:64] , 24'b0};
                        dataout_10= {data[79:72] , 24'b0}; 
                        dataout_11= {data[87:80] , 24'b0};
                        dataout_12= {data[95:88] , 24'b0};
                        dataout_13= {data[103:96] , 24'b0};
                        dataout_14= {data[111:104] ,24'b0}; 
                        dataout_15= {data[119:112] , 24'b0};
                        dataout_16= {data[127:120] , 24'b0};
                    end
                    else begin
                        dataout_1= {data[7:0] , 24'hf7f7f7};
                        dataout_2= {data[15:8] , 24'hf7f7f7}; 
                        dataout_3= {data[23:16] , 24'hf7f7f7};
                        dataout_4= {data[31:24] , 24'hf7f7f7};
                        dataout_5= {data[39:32] , 24'hf7f7f7};
                        dataout_6= {data[47:40] , 24'hf7f7f7}; 
                        dataout_7= {data[55:48] , 24'hf7f7f7};
                        dataout_8= {data[63:56] , 24'hf7f7f7};
                        dataout_9= {data[71:64] , 24'hf7f7f7};
                        dataout_10= {data[79:72] , 24'hf7f7f7}; 
                        dataout_11= {data[87:80] , 24'hf7f7f7};
                        dataout_12= {data[95:88] , 24'hf7f7f7};
                        dataout_13= {data[103:96] , 24'hf7f7f7};
                        dataout_14= {data[111:104] , 24'hf7f7f7}; 
                        dataout_15= {data[119:112] , 24'hf7f7f7};
                        dataout_16= {data[127:120] , 24'hf7f7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , 3'b111};
                d_k_out_2= {d_k_in[1] , 3'b111};
                d_k_out_3= {d_k_in[2] , 3'b111};
                d_k_out_4= {d_k_in[3] , 3'b111};
                d_k_out_5= {d_k_in[4] , 3'b111};
                d_k_out_6= {d_k_in[5] , 3'b111};
                d_k_out_7= {d_k_in[6] , 3'b111};
                d_k_out_8= {d_k_in[7] , 3'b111};
                d_k_out_9= {d_k_in[8] , 3'b111};
                d_k_out_10= {d_k_in[9] , 3'b111};
                d_k_out_11= {d_k_in[10] , 3'b111};
                d_k_out_12= {d_k_in[11] , 3'b111};
                d_k_out_13= {d_k_in[12] , 3'b111};
                d_k_out_14= {d_k_in[13] , 3'b111};
                d_k_out_15= {d_k_in[14] , 3'b111};
                d_k_out_16= {d_k_in[15] , 3'b111};
            end
            else if(data_valid[20] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[135:128] , 16'b0};
                        dataout_2= {data[15:8] , data[143:136] ,16'b0}; 
                        dataout_3= {data[23:16] , data[151:144] , 16'b0};
                        dataout_4= {data[31:24] , data[159:152] , 16'b0};
                        dataout_5= {data[39:32] , 24'b0};
                        dataout_6= {data[47:40] , 24'b0}; 
                        dataout_7= {data[55:48] , 24'b0};
                        dataout_8= {data[63:56] , 24'b0};
                        dataout_9= {data[71:64] , 24'b0};
                        dataout_10= {data[79:72] , 24'b0}; 
                        dataout_11= {data[87:80] , 24'b0};
                        dataout_12= {data[95:88] , 24'b0};
                        dataout_13= {data[103:96] , 24'b0};
                        dataout_14= {data[111:104] , 24'b0}; 
                        dataout_15= {data[119:112] , 24'b0};
                        dataout_16= {data[127:120] , 24'b0};
                    end
                    else begin
                        dataout_1= {data[7:0] , data[135:128] , 16'hf7f7};
                        dataout_2= {data[15:8] , data[143:136] ,16'hf7f7}; 
                        dataout_3= {data[23:16] , data[151:144] , 16'hf7f7};
                        dataout_4= {data[31:24] , data[159:152] , 16'hf7f7};
                        dataout_5= {data[39:32] , 24'hf7f7f7};
                        dataout_6= {data[47:40] , 24'hf7f7f7}; 
                        dataout_7= {data[55:48] , 24'hf7f7f7};
                        dataout_8= {data[63:56] , 24'hf7f7f7};
                        dataout_9= {data[71:64] , 24'hf7f7f7};
                        dataout_10= {data[79:72] , 24'hf7f7f7}; 
                        dataout_11= {data[87:80] , 24'hf7f7f7};
                        dataout_12= {data[95:88] , 24'hf7f7f7};
                        dataout_13= {data[103:96] , 24'hf7f7f7};
                        dataout_14= {data[111:104] , 24'hf7f7f7}; 
                        dataout_15= {data[119:112] , 24'hf7f7f7};
                        dataout_16= {data[127:120] , 24'hf7f7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[16] , 2'b11};
                d_k_out_2= {d_k_in[1] , d_k_in[17] , 2'b11};
                d_k_out_3= {d_k_in[2] , d_k_in[18] , 2'b11};
                d_k_out_4= {d_k_in[3] , d_k_in[19] , 2'b11};
                d_k_out_5= {d_k_in[4] , 3'b111};
                d_k_out_6= {d_k_in[5] , 3'b111};
                d_k_out_7= {d_k_in[6] , 3'b111};
                d_k_out_8= {d_k_in[7] , 3'b111};
                d_k_out_9= {d_k_in[8] , 3'b111};
                d_k_out_10= {d_k_in[9] , 3'b111};
                d_k_out_11= {d_k_in[10] , 3'b111};
                d_k_out_12= {d_k_in[11] , 3'b111};
                d_k_out_13= {d_k_in[12] , 3'b111};
                d_k_out_14= {d_k_in[13] , 3'b111};
                d_k_out_15= {d_k_in[14] , 3'b111};
                d_k_out_16= {d_k_in[15] , 3'b111};
            end
            else if(data_valid[24] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[135:128] , 16'b0};
                        dataout_2= {data[15:8] , data[143:136] , 16'b0}; 
                        dataout_3= {data[23:16] , data[151:144] , 16'b0};
                        dataout_4= {data[31:24] , data[159:152] , 16'b0};
                        dataout_5= {data[39:32] , data[167:160] , 16'b0};
                        dataout_6= {data[47:40] , data[175:168] , 16'b0}; 
                        dataout_7= {data[55:48] , data[183:176] , 16'b0};
                        dataout_8= {data[63:56] , data[191:184] , 16'b0};
                        dataout_9= {data[71:64] , 24'b0};
                        dataout_10= {data[79:72] , 24'b0}; 
                        dataout_11= {data[87:80] , 24'b0};
                        dataout_12= {data[95:88] , 24'b0};
                        dataout_13= {data[103:96] , 24'b0};
                        dataout_14= {data[111:104] , 24'b0}; 
                        dataout_15= {data[119:112] , 24'b0};
                        dataout_16= {data[127:120] , 24'b0};
                    end
                    else begin
                        dataout_1= {data[7:0] , data[135:128] , 16'hf7f7};
                        dataout_2= {data[15:8] , data[143:136] , 16'hf7f7}; 
                        dataout_3= {data[23:16] , data[151:144] , 16'hf7f7};
                        dataout_4= {data[31:24] , data[159:152] , 16'hf7f7};
                        dataout_5= {data[39:32] , data[167:160] , 16'hf7f7};
                        dataout_6= {data[47:40] , data[175:168] , 16'hf7f7}; 
                        dataout_7= {data[55:48] , data[183:176] , 16'hf7f7};
                        dataout_8= {data[63:56] , data[191:184] , 16'hf7f7};
                        dataout_9= {data[71:64] , 24'hf7f7f7};
                        dataout_10= {data[79:72] , 24'hf7f7f7}; 
                        dataout_11= {data[87:80] , 24'hf7f7f7};
                        dataout_12= {data[95:88] , 24'hf7f7f7};
                        dataout_13= {data[103:96] , 24'hf7f7f7};
                        dataout_14= {data[111:104] , 24'hf7f7f7}; 
                        dataout_15= {data[119:112] , 24'hf7f7f7};
                        dataout_16= {data[127:120] , 24'hf7f7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[16] , 2'b11};
                d_k_out_2= {d_k_in[1] , d_k_in[17] , 2'b11};
                d_k_out_3= {d_k_in[2] , d_k_in[18] , 2'b11};
                d_k_out_4= {d_k_in[3] , d_k_in[19] , 2'b11};
                d_k_out_5= {d_k_in[4] , d_k_in[20] , 2'b11};
                d_k_out_6= {d_k_in[5] , d_k_in[21] , 2'b11};
                d_k_out_7= {d_k_in[6] , d_k_in[22] , 2'b11};
                d_k_out_8= {d_k_in[7] , d_k_in[23] , 2'b11};
                d_k_out_9= {d_k_in[8] , 3'b111};
                d_k_out_10= {d_k_in[9] , 3'b111};
                d_k_out_11= {d_k_in[10] , 3'b111};
                d_k_out_12= {d_k_in[11] , 3'b111};
                d_k_out_13= {d_k_in[12] , 3'b111};
                d_k_out_14= {d_k_in[13] , 3'b111};
                d_k_out_15= {d_k_in[14] , 3'b111};
                d_k_out_16= {d_k_in[15] , 3'b111};
            end
            else if(data_valid[28] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[135:128] , 16'b0};
                        dataout_2= {data[15:8] , data[143:136] , 16'b0}; 
                        dataout_3= {data[23:16] , data[151:144] , 16'b0};
                        dataout_4= {data[31:24] , data[159:152] , 16'b0};
                        dataout_5= {data[39:32] , data[167:160] , 16'b0};
                        dataout_6= {data[47:40] , data[175:168] , 16'b0}; 
                        dataout_7= {data[55:48] , data[183:176] , 16'b0};
                        dataout_8= {data[63:56] , data[191:184] , 16'b0};
                        dataout_9= {data[71:64] , data[199:192] , 16'b0};
                        dataout_10= {data[79:72] , data[207:200] , 16'b0}; 
                        dataout_11= {data[87:80] , data[215:208] , 16'b0};
                        dataout_12= {data[95:88] , data[223:216] , 16'b0};
                        dataout_13= {data[103:96] , 24'b0};
                        dataout_14= {data[111:104] , 24'b0}; 
                        dataout_15= {data[119:112] , 24'b0};
                        dataout_16= {data[127:120] , 24'b0};  
                    end
                    else begin
                        dataout_1= {data[7:0] , data[135:128] , 16'hf7f7};
                        dataout_2= {data[15:8] , data[143:136] , 16'hf7f7}; 
                        dataout_3= {data[23:16] , data[151:144] , 16'hf7f7};
                        dataout_4= {data[31:24] , data[159:152] , 16'hf7f7};
                        dataout_5= {data[39:32] , data[167:160] , 16'hf7f7};
                        dataout_6= {data[47:40] , data[175:168] , 16'hf7f7}; 
                        dataout_7= {data[55:48] , data[183:176] , 16'hf7f7};
                        dataout_8= {data[63:56] , data[191:184] , 16'hf7f7};
                        dataout_9= {data[71:64] , data[199:192] , 16'hf7f7};
                        dataout_10= {data[79:72] , data[207:200] , 16'hf7f7}; 
                        dataout_11= {data[87:80] , data[215:208] , 16'hf7f7};
                        dataout_12= {data[95:88] , data[223:216] , 16'hf7f7};
                        dataout_13= {data[103:96] , 24'hf7f7f7};
                        dataout_14= {data[111:104] , 24'hf7f7f7}; 
                        dataout_15= {data[119:112] , 24'hf7f7f7};
                        dataout_16= {data[127:120] , 24'hf7f7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[16] , 2'b11};
                d_k_out_2= {d_k_in[1] , d_k_in[17] , 2'b11};
                d_k_out_3= {d_k_in[2] , d_k_in[18] , 2'b11};
                d_k_out_4= {d_k_in[3] , d_k_in[19] , 2'b11};
                d_k_out_5= {d_k_in[4] , d_k_in[20] , 2'b11};
                d_k_out_6= {d_k_in[5] , d_k_in[21] , 2'b11};
                d_k_out_7= {d_k_in[6] , d_k_in[22] , 2'b11};
                d_k_out_8= {d_k_in[7] , d_k_in[23] , 2'b11};
                d_k_out_9= {d_k_in[8] , d_k_in[24] , 2'b11};
                d_k_out_10= {d_k_in[9] , d_k_in[25] , 2'b11};
                d_k_out_11= {d_k_in[10] , d_k_in[26] , 2'b11};
                d_k_out_12= {d_k_in[11] , d_k_in[27] , 2'b11};
                d_k_out_13= {d_k_in[12] , 3'b111};
                d_k_out_14= {d_k_in[13] , 3'b111};
                d_k_out_15= {d_k_in[14] , 3'b111};
                d_k_out_16= {d_k_in[15] , 3'b111};
            end
            else if(data_valid[32] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[135:128] , 16'b0};
                        dataout_2= {data[15:8] , data[143:136] , 16'b0}; 
                        dataout_3= {data[23:16] , data[151:144] , 16'b0};
                        dataout_4= {data[31:24] , data[159:152] , 16'b0};
                        dataout_5= {data[39:32] , data[167:160] , 16'b0};
                        dataout_6= {data[47:40] , data[175:168] , 16'b0}; 
                        dataout_7= {data[55:48] , data[183:176] , 16'b0};
                        dataout_8= {data[63:56] , data[191:184] , 16'b0};
                        dataout_9= {data[71:64] , data[199:192] , 16'b0};
                        dataout_10= {data[79:72] , data[207:200] , 16'b0}; 
                        dataout_11= {data[87:80] , data[215:208] , 16'b0};
                        dataout_12= {data[95:88] , data[223:216] , 16'b0};
                        dataout_13= {data[103:96] , data[231:224] , 16'b0};
                        dataout_14= {data[111:104] , data[239:232] , 16'b0}; 
                        dataout_15= {data[119:112] , data[247:240] , 16'b0};
                        dataout_16= {data[127:120] , data[255:248] , 16'b0};
                    end
                    else begin
                        dataout_1= {data[7:0] , data[135:128] , 16'hf7f7};
                        dataout_2= {data[15:8] , data[143:136] , 16'hf7f7}; 
                        dataout_3= {data[23:16] , data[151:144] , 16'hf7f7};
                        dataout_4= {data[31:24] , data[159:152] , 16'hf7f7};
                        dataout_5= {data[39:32] , data[167:160] , 16'hf7f7};
                        dataout_6= {data[47:40] , data[175:168] , 16'hf7f7}; 
                        dataout_7= {data[55:48] , data[183:176] , 16'hf7f7};
                        dataout_8= {data[63:56] , data[191:184] , 16'hf7f7};
                        dataout_9= {data[71:64] , data[199:192] , 16'hf7f7};
                        dataout_10= {data[79:72] , data[207:200] , 16'hf7f7}; 
                        dataout_11= {data[87:80] , data[215:208] , 16'hf7f7};
                        dataout_12= {data[95:88] , data[223:216] , 16'hf7f7};
                        dataout_13= {data[103:96] , data[231:224] , 16'hf7f7};
                        dataout_14= {data[111:104] , data[239:232] , 16'hf7f7}; 
                        dataout_15= {data[119:112] , data[247:240] , 16'hf7f7};
                        dataout_16= {data[127:120] , data[255:248] , 16'hf7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[16] , 2'b11};
                d_k_out_2= {d_k_in[1] , d_k_in[17] , 2'b11};
                d_k_out_3= {d_k_in[2] , d_k_in[18] , 2'b11};
                d_k_out_4= {d_k_in[3] , d_k_in[19] , 2'b11};
                d_k_out_5= {d_k_in[4] , d_k_in[20] , 2'b11};
                d_k_out_6= {d_k_in[5] , d_k_in[21] , 2'b11};
                d_k_out_7= {d_k_in[6] , d_k_in[22] , 2'b11};
                d_k_out_8= {d_k_in[7] , d_k_in[23] , 2'b11};
                d_k_out_9= {d_k_in[8] , d_k_in[24] , 2'b11};
                d_k_out_10= {d_k_in[9] , d_k_in[25] , 2'b11};
                d_k_out_11= {d_k_in[10] , d_k_in[26] , 2'b11};
                d_k_out_12= {d_k_in[11] , d_k_in[27] , 2'b11};
                d_k_out_13= {d_k_in[12] , d_k_in[28] , 2'b11};
                d_k_out_14= {d_k_in[13] , d_k_in[29] , 2'b11};
                d_k_out_15= {d_k_in[14] , d_k_in[30] , 2'b11};
                d_k_out_16= {d_k_in[15] , d_k_in[31] , 2'b11};
            end 
            else if(data_valid[36] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[135:128] , data[263:256] , 8'b0};
                        dataout_2= {data[15:8] , data[143:136] , data[271:264] , 8'b0}; 
                        dataout_3= {data[23:16] , data[151:144] , data[279:272] , 8'b0};
                        dataout_4= {data[31:24] , data[159:152] , data[287:280] , 8'b0};
                        dataout_5= {data[39:32] , data[167:160] , 16'b0};
                        dataout_6= {data[47:40] , data[175:168] , 16'b0}; 
                        dataout_7= {data[55:48] , data[183:176] , 16'b0};
                        dataout_8= {data[63:56] , data[191:184] , 16'b0};
                        dataout_9= {data[71:64] , data[199:192] , 16'b0};
                        dataout_10= {data[79:72] , data[207:200] , 16'b0}; 
                        dataout_11= {data[87:80] , data[215:208] , 16'b0};
                        dataout_12= {data[95:88] , data[223:216] , 16'b0};
                        dataout_13= {data[103:96] , data[231:224] , 16'b0};
                        dataout_14= {data[111:104] , data[239:232] , 16'b0}; 
                        dataout_15= {data[119:112] , data[247:240] , 16'b0};
                        dataout_16= {data[127:120] , data[255:248] , 16'b0};
                    end
                    else begin
                        dataout_1= {data[7:0] , data[135:128] , data[263:256] , 8'hf7};
                        dataout_2= {data[15:8] , data[143:136] , data[271:264] , 8'hf7}; 
                        dataout_3= {data[23:16] , data[151:144] , data[279:272] , 8'hf7};
                        dataout_4= {data[31:24] , data[159:152] , data[287:280] , 8'hf7};
                        dataout_5= {data[39:32] , data[167:160] , 16'hf7f7};
                        dataout_6= {data[47:40] , data[175:168] , 16'hf7f7}; 
                        dataout_7= {data[55:48] , data[183:176] , 16'hf7f7};
                        dataout_8= {data[63:56] , data[191:184] , 16'hf7f7};
                        dataout_9= {data[71:64] , data[199:192] , 16'hf7f7};
                        dataout_10= {data[79:72] , data[207:200] , 16'hf7f7}; 
                        dataout_11= {data[87:80] , data[215:208] , 16'hf7f7};
                        dataout_12= {data[95:88] , data[223:216] , 16'hf7f7};
                        dataout_13= {data[103:96] , data[231:224] , 16'hf7f7};
                        dataout_14= {data[111:104] , data[239:232] , 16'hf7f7}; 
                        dataout_15= {data[119:112] , data[247:240] , 16'hf7f7};
                        dataout_16= {data[127:120] , data[255:248] , 16'hf7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[16] , d_k_in[32] , 1'b1};
                d_k_out_2= {d_k_in[1] , d_k_in[17] , d_k_in[33] , 1'b1};
                d_k_out_3= {d_k_in[2] , d_k_in[18] , d_k_in[34] , 1'b1};
                d_k_out_4= {d_k_in[3] , d_k_in[19] , d_k_in[35] , 1'b1};
                d_k_out_5= {d_k_in[4] , d_k_in[20] , 2'b11};
                d_k_out_6= {d_k_in[5] , d_k_in[21] , 2'b11};
                d_k_out_7= {d_k_in[6] , d_k_in[22] , 2'b11};
                d_k_out_8= {d_k_in[7] , d_k_in[23] , 2'b11};
                d_k_out_9= {d_k_in[8] , d_k_in[24] , 2'b11};
                d_k_out_10= {d_k_in[9] , d_k_in[25] , 2'b11};
                d_k_out_11= {d_k_in[10] , d_k_in[26] , 2'b11};
                d_k_out_12= {d_k_in[11] , d_k_in[27] , 2'b11};
                d_k_out_13= {d_k_in[12] , d_k_in[28] , 2'b11};
                d_k_out_14= {d_k_in[13] , d_k_in[29] , 2'b11};
                d_k_out_15= {d_k_in[14] , d_k_in[30] , 2'b11};
                d_k_out_16= {d_k_in[15] , d_k_in[31] , 2'b11};
            end            
            else if(data_valid[40] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[135:128] , data[263:256] , 8'b0};
                        dataout_2= {data[15:8] , data[143:136] , data[271:264] , 8'b0}; 
                        dataout_3= {data[23:16] , data[151:144] , data[279:272] , 8'b0};
                        dataout_4= {data[31:24] , data[159:152] , data[287:280] , 8'b0};
                        dataout_5= {data[39:32] , data[167:160] , data[295:288] , 8'b0};
                        dataout_6= {data[47:40] , data[175:168] , data[303:296] , 8'b0}; 
                        dataout_7= {data[55:48] , data[183:176] , data[311:304] , 8'b0};
                        dataout_8= {data[63:56] , data[191:184] , data[319:312] , 8'b0};
                        dataout_9= {data[71:64] , data[199:192] , 16'b0};
                        dataout_10= {data[79:72] , data[207:200] , 16'b0}; 
                        dataout_11= {data[87:80] , data[215:208] , 16'b0};
                        dataout_12= {data[95:88] , data[223:216] , 16'b0};
                        dataout_13= {data[103:96] , data[231:224] , 16'b0};
                        dataout_14= {data[111:104] , data[239:232] , 16'b0}; 
                        dataout_15= {data[119:112] , data[247:240] , 16'b0};
                        dataout_16= {data[127:120] , data[255:248] , 16'b0};
                    end
                    else begin
                        dataout_1= {data[7:0] , data[135:128] , data[263:256] , 8'hf7};
                        dataout_2= {data[15:8] , data[143:136] , data[271:264] , 8'hf7}; 
                        dataout_3= {data[23:16] , data[151:144] , data[279:272] , 8'hf7};
                        dataout_4= {data[31:24] , data[159:152] , data[287:280] , 8'hf7};
                        dataout_5= {data[39:32] , data[167:160] , data[295:288] , 8'hf7};
                        dataout_6= {data[47:40] , data[175:168] , data[303:296] , 8'hf7}; 
                        dataout_7= {data[55:48] , data[183:176] , data[311:304] , 8'hf7};
                        dataout_8= {data[63:56] , data[191:184] , data[319:312] , 8'hf7};
                        dataout_9= {data[71:64] , data[199:192] , 16'hf7f7};
                        dataout_10= {data[79:72] , data[207:200] , 16'hf7f7}; 
                        dataout_11= {data[87:80] , data[215:208] , 16'hf7f7};
                        dataout_12= {data[95:88] , data[223:216] , 16'hf7f7};
                        dataout_13= {data[103:96] , data[231:224] , 16'hf7f7};
                        dataout_14= {data[111:104] , data[239:232] , 16'hf7f7}; 
                        dataout_15= {data[119:112] , data[247:240] , 16'hf7f7};
                        dataout_16= {data[127:120] , data[255:248] , 16'hf7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[16] , d_k_in[32] , 1'b1};
                d_k_out_2= {d_k_in[1] , d_k_in[17] , d_k_in[33] , 1'b1};
                d_k_out_3= {d_k_in[2] , d_k_in[18] , d_k_in[34] , 1'b1};
                d_k_out_4= {d_k_in[3] , d_k_in[19] , d_k_in[35] , 1'b1};
                d_k_out_5= {d_k_in[4] , d_k_in[20] , d_k_in[36] , 1'b1};
                d_k_out_6= {d_k_in[5] , d_k_in[21] , d_k_in[37] , 1'b1};
                d_k_out_7= {d_k_in[6] , d_k_in[22] , d_k_in[38] , 1'b1};
                d_k_out_8= {d_k_in[7] , d_k_in[23] , d_k_in[39] , 1'b1};
                d_k_out_9= {d_k_in[8] , d_k_in[24] , 2'b11};
                d_k_out_10= {d_k_in[9] , d_k_in[25] , 2'b11};
                d_k_out_11= {d_k_in[10] , d_k_in[26] , 2'b11};
                d_k_out_12= {d_k_in[11] , d_k_in[27] , 2'b11};
                d_k_out_13= {d_k_in[12] , d_k_in[28] , 2'b11};
                d_k_out_14= {d_k_in[13] , d_k_in[29] , 2'b11};
                d_k_out_15= {d_k_in[14] , d_k_in[30] , 2'b11};
                d_k_out_16= {d_k_in[15] , d_k_in[31] , 2'b11};
            end
            else if(data_valid[44] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[135:128] , data[263:256] , 8'b0};
                        dataout_2= {data[15:8] , data[143:136] , data[271:264] , 8'b0}; 
                        dataout_3= {data[23:16] , data[151:144] , data[279:272] , 8'b0};
                        dataout_4= {data[31:24] , data[159:152] , data[287:280] , 8'b0};
                        dataout_5= {data[39:32] , data[167:160] , data[295:288] , 8'b0};
                        dataout_6= {data[47:40] , data[175:168] , data[303:296] , 8'b0}; 
                        dataout_7= {data[55:48] , data[183:176] , data[311:304] , 8'b0};
                        dataout_8= {data[63:56] , data[191:184] , data[319:312] , 8'b0};
                        dataout_9= {data[71:64] , data[199:192] , data[327:320] , 8'b0};
                        dataout_10= {data[79:72] , data[207:200] , data[335:328] , 8'b0}; 
                        dataout_11= {data[87:80] , data[215:208] , data[343:336] , 8'b0};
                        dataout_12= {data[95:88] , data[223:216] , data[351:344] , 8'b0};
                        dataout_13= {data[103:96] , data[231:224] , 16'b0};
                        dataout_14= {data[111:104] , data[239:232] , 16'b0}; 
                        dataout_15= {data[119:112] , data[247:240] , 16'b0};
                        dataout_16= {data[127:120] , data[255:248] , 16'b0};
                    end
                    else begin
                        dataout_1= {data[7:0] , data[135:128] , data[263:256] , 8'hf7};
                        dataout_2= {data[15:8] , data[143:136] , data[271:264] , 8'hf7}; 
                        dataout_3= {data[23:16] , data[151:144] , data[279:272] , 8'hf7};
                        dataout_4= {data[31:24] , data[159:152] , data[287:280] , 8'hf7};
                        dataout_5= {data[39:32] , data[167:160] , data[295:288] , 8'hf7};
                        dataout_6= {data[47:40] , data[175:168] , data[303:296] , 8'hf7}; 
                        dataout_7= {data[55:48] , data[183:176] , data[311:304] , 8'hf7};
                        dataout_8= {data[63:56] , data[191:184] , data[319:312] , 8'hf7};
                        dataout_9= {data[71:64] , data[199:192] , data[327:320] , 8'hf7};
                        dataout_10= {data[79:72] , data[207:200] , data[335:328] , 8'hf7}; 
                        dataout_11= {data[87:80] , data[215:208] , data[343:336] , 8'hf7};
                        dataout_12= {data[95:88] , data[223:216] , data[351:344] , 8'hf7};
                        dataout_13= {data[103:96] , data[231:224] , 16'hf7f7};
                        dataout_14= {data[111:104] , data[239:232] , 16'hf7f7}; 
                        dataout_15= {data[119:112] , data[247:240] , 16'hf7f7};
                        dataout_16= {data[127:120] , data[255:248] , 16'hf7f7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[16] , d_k_in[32] , 1'b1};
                d_k_out_2= {d_k_in[1] , d_k_in[17] , d_k_in[33] , 1'b1};
                d_k_out_3= {d_k_in[2] , d_k_in[18] , d_k_in[34] , 1'b1};
                d_k_out_4= {d_k_in[3] , d_k_in[19] , d_k_in[35] , 1'b1};
                d_k_out_5= {d_k_in[4] , d_k_in[20] , d_k_in[36] , 1'b1};
                d_k_out_6= {d_k_in[5] , d_k_in[21] , d_k_in[37] , 1'b1};
                d_k_out_7= {d_k_in[6] , d_k_in[22] , d_k_in[38] , 1'b1};
                d_k_out_8= {d_k_in[7] , d_k_in[23] , d_k_in[39] , 1'b1};
                d_k_out_9= {d_k_in[8] , d_k_in[24] , d_k_in[40] , 1'b1};
                d_k_out_10= {d_k_in[9] , d_k_in[25] , d_k_in[41] , 1'b1};
                d_k_out_11= {d_k_in[10] , d_k_in[26] , d_k_in[42] , 1'b1};
                d_k_out_12= {d_k_in[11] , d_k_in[27] , d_k_in[43] , 1'b1};
                d_k_out_13= {d_k_in[12] , d_k_in[28] , 2'b11};
                d_k_out_14= {d_k_in[13] , d_k_in[29] , 2'b11};
                d_k_out_15= {d_k_in[14] , d_k_in[30] , 2'b11};
                d_k_out_16= {d_k_in[15] , d_k_in[31] , 2'b11};
            end
            else if(data_valid[48] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[135:128] , data[263:256] , 8'b0};
                        dataout_2= {data[15:8] , data[143:136] , data[271:264] , 8'b0}; 
                        dataout_3= {data[23:16] , data[151:144] , data[279:272] , 8'b0};
                        dataout_4= {data[31:24] , data[159:152] , data[287:280] , 8'b0};
                        dataout_5= {data[39:32] , data[167:160] , data[295:288] , 8'b0};
                        dataout_6= {data[47:40] , data[175:168] , data[303:296] , 8'b0}; 
                        dataout_7= {data[55:48] , data[183:176] , data[311:304] , 8'b0};
                        dataout_8= {data[63:56] , data[191:184] , data[319:312] , 8'b0};
                        dataout_9= {data[71:64] , data[199:192] , data[327:320] , 8'b0};
                        dataout_10= {data[79:72] , data[207:200] , data[335:328] , 8'b0}; 
                        dataout_11= {data[87:80] , data[215:208] , data[343:336] , 8'b0};
                        dataout_12= {data[95:88] , data[223:216] , data[351:344] , 8'b0};
                        dataout_13= {data[103:96] , data[231:224] , data[359:352] , 8'b0};
                        dataout_14= {data[111:104] , data[239:232] , data[367:360] , 8'b0}; 
                        dataout_15= {data[119:112] , data[247:240] , data[375:368] , 8'b0};
                        dataout_16= {data[127:120] , data[255:248] , data[383:376] , 8'b0};   
                    end
                    else begin
                        dataout_1= {data[7:0] , data[135:128] , data[263:256] , 8'hf7};
                        dataout_2= {data[15:8] , data[143:136] , data[271:264] , 8'hf7}; 
                        dataout_3= {data[23:16] , data[151:144] , data[279:272] , 8'hf7};
                        dataout_4= {data[31:24] , data[159:152] , data[287:280] , 8'hf7};
                        dataout_5= {data[39:32] , data[167:160] , data[295:288] , 8'hf7};
                        dataout_6= {data[47:40] , data[175:168] , data[303:296] , 8'hf7}; 
                        dataout_7= {data[55:48] , data[183:176] , data[311:304] , 8'hf7};
                        dataout_8= {data[63:56] , data[191:184] , data[319:312] , 8'hf7};
                        dataout_9= {data[71:64] , data[199:192] , data[327:320] , 8'hf7};
                        dataout_10= {data[79:72] , data[207:200] , data[335:328] , 8'hf7}; 
                        dataout_11= {data[87:80] , data[215:208] , data[343:336] , 8'hf7};
                        dataout_12= {data[95:88] , data[223:216] , data[351:344] , 8'hf7};
                        dataout_13= {data[103:96] , data[231:224] , data[359:352] , 8'hf7};
                        dataout_14= {data[111:104] , data[239:232] , data[367:360] , 8'hf7}; 
                        dataout_15= {data[119:112] , data[247:240] , data[375:368] , 8'hf7};
                        dataout_16= {data[127:120] , data[255:248] , data[383:376] , 8'hf7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[16] , d_k_in[32] , 1'b1};
                d_k_out_2= {d_k_in[1] , d_k_in[17] , d_k_in[33] , 1'b1};
                d_k_out_3= {d_k_in[2] , d_k_in[18] , d_k_in[34] , 1'b1};
                d_k_out_4= {d_k_in[3] , d_k_in[19] , d_k_in[35] , 1'b1};
                d_k_out_5= {d_k_in[4] , d_k_in[20] , d_k_in[36] , 1'b1};
                d_k_out_6= {d_k_in[5] , d_k_in[21] , d_k_in[37] , 1'b1};
                d_k_out_7= {d_k_in[6] , d_k_in[22] , d_k_in[38] , 1'b1};
                d_k_out_8= {d_k_in[7] , d_k_in[23] , d_k_in[39] , 1'b1};
                d_k_out_9= {d_k_in[8] , d_k_in[24] , d_k_in[40] , 1'b1};
                d_k_out_10= {d_k_in[9] , d_k_in[25] , d_k_in[41] , 1'b1};
                d_k_out_11= {d_k_in[10] , d_k_in[26] , d_k_in[42] , 1'b1};
                d_k_out_12= {d_k_in[11] , d_k_in[27] , d_k_in[43] , 1'b1};
                d_k_out_13= {d_k_in[12] , d_k_in[28] , d_k_in[44] , 1'b1};
                d_k_out_14= {d_k_in[13] , d_k_in[29] , d_k_in[45] , 1'b1};
                d_k_out_15= {d_k_in[14] , d_k_in[30] , d_k_in[46] , 1'b1};
                d_k_out_16= {d_k_in[15] , d_k_in[31] , d_k_in[47] , 1'b1};
            end            
            else if(data_valid[52] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[135:128] , data[263:256] , data[391:384]};
                        dataout_2= {data[15:8] , data[143:136] , data[271:264] , data[399:392]}; 
                        dataout_3= {data[23:16] , data[151:144] , data[279:272] , data[407:400]};
                        dataout_4= {data[31:24] , data[159:152] , data[287:280] , data[415:408]};
                        dataout_5= {data[39:32] , data[167:160] , data[295:288] , 8'b0};
                        dataout_6= {data[47:40] , data[175:168] , data[303:296] , 8'b0}; 
                        dataout_7= {data[55:48] , data[183:176] , data[311:304] , 8'b0};
                        dataout_8= {data[63:56] , data[191:184] , data[319:312] , 8'b0};
                        dataout_9= {data[71:64] , data[199:192] , data[327:320] , 8'b0};
                        dataout_10= {data[79:72] , data[207:200] , data[335:328] , 8'b0}; 
                        dataout_11= {data[87:80] , data[215:208] , data[343:336] , 8'b0};
                        dataout_12= {data[95:88] , data[223:216] , data[351:344] , 8'b0};
                        dataout_13= {data[103:96] , data[231:224] , data[359:352] , 8'b0};
                        dataout_14= {data[111:104] , data[239:232] , data[367:360] , 8'b0}; 
                        dataout_15= {data[119:112] , data[247:240] , data[375:368] , 8'b0};
                        dataout_16= {data[127:120] , data[255:248] , data[383:376] , 8'b0};
                    end
                    else begin
                        dataout_1= {data[7:0] , data[135:128] , data[263:256] , data[391:384]};
                        dataout_2= {data[15:8] , data[143:136] , data[271:264] , data[399:392]}; 
                        dataout_3= {data[23:16] , data[151:144] , data[279:272] , data[407:400]};
                        dataout_4= {data[31:24] , data[159:152] , data[287:280] , data[415:408]};
                        dataout_5= {data[39:32] , data[167:160] , data[295:288] , 8'hf7};
                        dataout_6= {data[47:40] , data[175:168] , data[303:296] , 8'hf7}; 
                        dataout_7= {data[55:48] , data[183:176] , data[311:304] , 8'hf7};
                        dataout_8= {data[63:56] , data[191:184] , data[319:312] , 8'hf7};
                        dataout_9= {data[71:64] , data[199:192] , data[327:320] , 8'hf7};
                        dataout_10= {data[79:72] , data[207:200] , data[335:328] , 8'hf7}; 
                        dataout_11= {data[87:80] , data[215:208] , data[343:336] , 8'hf7};
                        dataout_12= {data[95:88] , data[223:216] , data[351:344] , 8'hf7};
                        dataout_13= {data[103:96] , data[231:224] , data[359:352] , 8'hf7};
                        dataout_14= {data[111:104] , data[239:232] , data[367:360] , 8'hf7}; 
                        dataout_15= {data[119:112] , data[247:240] , data[375:368] , 8'hf7};
                        dataout_16= {data[127:120] , data[255:248] , data[383:376] , 8'hf7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[16] , d_k_in[32] , d_k_in[48]};
                d_k_out_2= {d_k_in[1] , d_k_in[17] , d_k_in[33] , d_k_in[49]};
                d_k_out_3= {d_k_in[2] , d_k_in[18] , d_k_in[34] , d_k_in[50]};
                d_k_out_4= {d_k_in[3] , d_k_in[19] , d_k_in[35] , d_k_in[51]};
                d_k_out_5= {d_k_in[4] , d_k_in[20] , d_k_in[36] , 1'b1};
                d_k_out_6= {d_k_in[5] , d_k_in[21] , d_k_in[37] , 1'b1};
                d_k_out_7= {d_k_in[6] , d_k_in[22] , d_k_in[38] , 1'b1};
                d_k_out_8= {d_k_in[7] , d_k_in[23] , d_k_in[39] , 1'b1};
                d_k_out_9= {d_k_in[8] , d_k_in[24] , d_k_in[40] , 1'b1};
                d_k_out_10= {d_k_in[9] , d_k_in[25] , d_k_in[41] , 1'b1};
                d_k_out_11= {d_k_in[10] , d_k_in[26] , d_k_in[42] , 1'b1};
                d_k_out_12= {d_k_in[11] , d_k_in[27] , d_k_in[43] , 1'b1};
                d_k_out_13= {d_k_in[12] , d_k_in[28] , d_k_in[44] , 1'b1};
                d_k_out_14= {d_k_in[13] , d_k_in[29] , d_k_in[45] , 1'b1};
                d_k_out_15= {d_k_in[14] , d_k_in[30] , d_k_in[46] , 1'b1};
                d_k_out_16= {d_k_in[15] , d_k_in[31] , d_k_in[47] , 1'b1};
            end                          
            else if(data_valid[56] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[135:128] , data[263:256] , data[391:384]};
                        dataout_2= {data[15:8] , data[143:136] , data[271:264] , data[399:392]}; 
                        dataout_3= {data[23:16] , data[151:144] , data[279:272] , data[407:400]};
                        dataout_4= {data[31:24] , data[159:152] , data[287:280] , data[415:408]};
                        dataout_5= {data[39:32] , data[167:160] , data[295:288] , data[423:416]};
                        dataout_6= {data[47:40] , data[175:168] , data[303:296] , data[431:424]}; 
                        dataout_7= {data[55:48] , data[183:176] , data[311:304] , data[439:432]};
                        dataout_8= {data[63:56] , data[191:184] , data[319:312] , data[447:440]};
                        dataout_9= {data[71:64] , data[199:192] , data[327:320] , 8'b0};
                        dataout_10= {data[79:72] , data[207:200] , data[335:328] , 8'b0}; 
                        dataout_11= {data[87:80] , data[215:208] , data[343:336] , 8'b0};
                        dataout_12= {data[95:88] , data[223:216] , data[351:344] , 8'b0};
                        dataout_13= {data[103:96] , data[231:224] , data[359:352] , 8'b0};
                        dataout_14= {data[111:104] , data[239:232] , data[367:360] , 8'b0}; 
                        dataout_15= {data[119:112] , data[247:240] , data[375:368] , 8'b0};
                        dataout_16= {data[127:120] , data[255:248] , data[383:376] , 8'b0}; 
                    end
                    else begin
                        dataout_1= {data[7:0] , data[135:128] , data[263:256] , data[391:384]};
                        dataout_2= {data[15:8] , data[143:136] , data[271:264] , data[399:392]}; 
                        dataout_3= {data[23:16] , data[151:144] , data[279:272] , data[407:400]};
                        dataout_4= {data[31:24] , data[159:152] , data[287:280] , data[415:408]};
                        dataout_5= {data[39:32] , data[167:160] , data[295:288] , data[423:416]};
                        dataout_6= {data[47:40] , data[175:168] , data[303:296] , data[431:424]}; 
                        dataout_7= {data[55:48] , data[183:176] , data[311:304] , data[439:432]};
                        dataout_8= {data[63:56] , data[191:184] , data[319:312] , data[447:440]};
                        dataout_9= {data[71:64] , data[199:192] , data[327:320] , 8'hf7};
                        dataout_10= {data[79:72] , data[207:200] , data[335:328] , 8'hf7}; 
                        dataout_11= {data[87:80] , data[215:208] , data[343:336] , 8'hf7};
                        dataout_12= {data[95:88] , data[223:216] , data[351:344] , 8'hf7};
                        dataout_13= {data[103:96] , data[231:224] , data[359:352] , 8'hf7};
                        dataout_14= {data[111:104] , data[239:232] , data[367:360] , 8'hf7}; 
                        dataout_15= {data[119:112] , data[247:240] , data[375:368] , 8'hf7};
                        dataout_16= {data[127:120] , data[255:248] , data[383:376] , 8'hf7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[16] , d_k_in[32] , d_k_in[48]};
                d_k_out_2= {d_k_in[1] , d_k_in[17] , d_k_in[33] , d_k_in[49]};
                d_k_out_3= {d_k_in[2] , d_k_in[18] , d_k_in[34] , d_k_in[50]};
                d_k_out_4= {d_k_in[3] , d_k_in[19] , d_k_in[35] , d_k_in[51]};
                d_k_out_5= {d_k_in[4] , d_k_in[20] , d_k_in[36] , d_k_in[52]};
                d_k_out_6= {d_k_in[5] , d_k_in[21] , d_k_in[37] , d_k_in[53]};
                d_k_out_7= {d_k_in[6] , d_k_in[22] , d_k_in[38] , d_k_in[54]};
                d_k_out_8= {d_k_in[7] , d_k_in[23] , d_k_in[39] , d_k_in[55]};
                d_k_out_9= {d_k_in[8] , d_k_in[24] , d_k_in[40] , 1'b1};
                d_k_out_10= {d_k_in[9] , d_k_in[25] , d_k_in[41] , 1'b1};
                d_k_out_11= {d_k_in[10] , d_k_in[26] , d_k_in[42] , 1'b1};
                d_k_out_12= {d_k_in[11] , d_k_in[27] , d_k_in[43] , 1'b1};
                d_k_out_13= {d_k_in[12] , d_k_in[28] , d_k_in[44] , 1'b1};
                d_k_out_14= {d_k_in[13] , d_k_in[29] , d_k_in[45] , 1'b1};
                d_k_out_15= {d_k_in[14] , d_k_in[30] , d_k_in[46] , 1'b1};
                d_k_out_16= {d_k_in[15] , d_k_in[31] , d_k_in[47] , 1'b1};
            end              
            else if(data_valid[60] == 0 && data_valid[0] == 1) begin
                    if(generation>=3) begin
                        dataout_1= {data[7:0] , data[135:128] , data[263:256] , data[391:384]};
                        dataout_2= {data[15:8] , data[143:136] , data[271:264] , data[399:392]}; 
                        dataout_3= {data[23:16] , data[151:144] , data[279:272] , data[407:400]};
                        dataout_4= {data[31:24] , data[159:152] , data[287:280] , data[415:408]};
                        dataout_5= {data[39:32] , data[167:160] , data[295:288] , data[423:416]};
                        dataout_6= {data[47:40] , data[175:168] , data[303:296] , data[431:424]}; 
                        dataout_7= {data[55:48] , data[183:176] , data[311:304] , data[439:432]};
                        dataout_8= {data[63:56] , data[191:184] , data[319:312] , data[447:440]};
                        dataout_9= {data[71:64] , data[199:192] , data[327:320] , data[455:448]};
                        dataout_10= {data[79:72] , data[207:200] , data[335:328] , data[463:456]}; 
                        dataout_11= {data[87:80] , data[215:208] , data[343:336] , data[471:464]};
                        dataout_12= {data[95:88] , data[223:216] , data[351:344] , data[479:472]};
                        dataout_13= {data[103:96] , data[231:224] , data[359:352] , 8'b0};
                        dataout_14= {data[111:104] , data[239:232] , data[367:360] , 8'b0}; 
                        dataout_15= {data[119:112] , data[247:240] , data[375:368] , 8'b0};
                        dataout_16= {data[127:120] , data[255:248] , data[383:376] , 8'b0};
                    end
                    else begin
                        dataout_1= {data[7:0] , data[135:128] , data[263:256] , data[391:384]};
                        dataout_2= {data[15:8] , data[143:136] , data[271:264] , data[399:392]}; 
                        dataout_3= {data[23:16] , data[151:144] , data[279:272] , data[407:400]};
                        dataout_4= {data[31:24] , data[159:152] , data[287:280] , data[415:408]};
                        dataout_5= {data[39:32] , data[167:160] , data[295:288] , data[423:416]};
                        dataout_6= {data[47:40] , data[175:168] , data[303:296] , data[431:424]}; 
                        dataout_7= {data[55:48] , data[183:176] , data[311:304] , data[439:432]};
                        dataout_8= {data[63:56] , data[191:184] , data[319:312] , data[447:440]};
                        dataout_9= {data[71:64] , data[199:192] , data[327:320] , data[455:448]};
                        dataout_10= {data[79:72] , data[207:200] , data[335:328] , data[463:456]}; 
                        dataout_11= {data[87:80] , data[215:208] , data[343:336] , data[471:464]};
                        dataout_12= {data[95:88] , data[223:216] , data[351:344] , data[479:472]};
                        dataout_13= {data[103:96] , data[231:224] , data[359:352] , 8'hf7};
                        dataout_14= {data[111:104] , data[239:232] , data[367:360] , 8'hf7}; 
                        dataout_15= {data[119:112] , data[247:240] , data[375:368] , 8'hf7};
                        dataout_16= {data[127:120] , data[255:248] , data[383:376] , 8'hf7};                        
                    end


                d_k_out_1= {d_k_in[0] , d_k_in[16] , d_k_in[32] , d_k_in[48]};
                d_k_out_2= {d_k_in[1] , d_k_in[17] , d_k_in[33] , d_k_in[49]};
                d_k_out_3= {d_k_in[2] , d_k_in[18] , d_k_in[34] , d_k_in[50]};
                d_k_out_4= {d_k_in[3] , d_k_in[19] , d_k_in[35] , d_k_in[51]};
                d_k_out_5= {d_k_in[4] , d_k_in[20] , d_k_in[36] , d_k_in[52]};
                d_k_out_6= {d_k_in[5] , d_k_in[21] , d_k_in[37] , d_k_in[53]};
                d_k_out_7= {d_k_in[6] , d_k_in[22] , d_k_in[38] , d_k_in[54]};
                d_k_out_8= {d_k_in[7] , d_k_in[23] , d_k_in[39] , d_k_in[55]};
                d_k_out_9= {d_k_in[8] , d_k_in[24] , d_k_in[40] , d_k_in[56]};
                d_k_out_10= {d_k_in[9] , d_k_in[25] , d_k_in[41] , d_k_in[57]};
                d_k_out_11= {d_k_in[10] , d_k_in[26] , d_k_in[42] , d_k_in[58]};
                d_k_out_12= {d_k_in[11] , d_k_in[27] , d_k_in[43] , d_k_in[59]};
                d_k_out_13= {d_k_in[12] , d_k_in[28] , d_k_in[44] , 1'b1};
                d_k_out_14= {d_k_in[13] , d_k_in[29] , d_k_in[45] , 1'b1};
                d_k_out_15= {d_k_in[14] , d_k_in[30] , d_k_in[46] , 1'b1};
                d_k_out_16= {d_k_in[15] , d_k_in[31] , d_k_in[47] , 1'b1};
            end            
  end
end

endmodule

