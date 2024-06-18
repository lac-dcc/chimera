// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////////////
//sclk，sdin数据传输时序代码（i2c写控制代码）
module i2c_com(clock_i2c        ,  //i2c控制接口传输所需时钟，0-400khz，此处为20khz
               rstn      ,     
               ack              ,  //应答信号
               i2c_data         ,  //sdin接口传输的24位数据
               start            ,  //开始传输标志
               tr_end           ,  //传输结束标志
               i2c_sclk         ,  //FPGA与camera iic时钟接口
               i2c_sdat            //FPGA与camera iic数据接口
);        
    input [23:0]i2c_data/*synthesis PAP_MARK_DEBUG="1"*/;
    input rstn;
    input clock_i2c;
    output ack;
    input start;
    output tr_end;
    output i2c_sclk;
    inout i2c_sdat;
    reg [6:0] cyc_count/*synthesis PAP_MARK_DEBUG="1"*/;
    reg reg_sdat/*synthesis PAP_MARK_DEBUG="1"*/;
    reg sclk;
    reg ack1,ack2,ack3/*synthesis PAP_MARK_DEBUG="1"*/;
    reg tr_end;
    reg clock_i2c_test; 
   
    wire i2c_sclk;
    wire i2c_sdat;
    wire ack;
   
    assign ack=ack1|ack2|ack3;
    assign i2c_sclk=sclk|(((cyc_count>=8)&(cyc_count<=117))?clock_i2c_test:0);//(cyc_count>=4)&(cyc_count<=30))?~clock_i2c:0
    assign i2c_sdat=reg_sdat?1'bz:0; 
   
    always@(posedge clock_i2c)
    begin
       if(!rstn)
         cyc_count<=7'b111_1111;
       else 
		   begin
           if(start==0)
             cyc_count<=0;
           else if(cyc_count<7'b111_1111)
             cyc_count<=cyc_count+1;
         end
    end
	 
    always@(posedge clock_i2c)
    begin
      if(cyc_count==0)
         clock_i2c_test<=1'b0;
    else if(cyc_count>0&&cyc_count[0]==0)
         clock_i2c_test<=~clock_i2c_test;
    end


    always@(posedge clock_i2c)
    begin
       if(!rstn)
       begin
          tr_end<=0;
          ack1<=1;
          ack2<=1;
          ack3<=1;
          sclk<=1;
          reg_sdat<=1;
       end
       else
          case(cyc_count)
          0:begin ack1<=1;ack2<=1;ack3<=1;tr_end<=0;sclk<=1;reg_sdat<=1;end
          4:reg_sdat<=0;                 //开始传输
          8:sclk<=0;
          9:reg_sdat<=i2c_data[23];
          13:reg_sdat<=i2c_data[22];
          17:reg_sdat<=i2c_data[21];
          21:reg_sdat<=i2c_data[20];
          25:reg_sdat<=i2c_data[19];
          29:reg_sdat<=i2c_data[18];
          33:reg_sdat<=i2c_data[17];
          37:reg_sdat<=i2c_data[16];
          41:reg_sdat<=1;                //应答信号
          45:begin reg_sdat<=i2c_data[15];ack1<=i2c_sdat;end
          49:reg_sdat<=i2c_data[14];
          53:reg_sdat<=i2c_data[13];
          57:reg_sdat<=i2c_data[12];
          61:reg_sdat<=i2c_data[11];
          65:reg_sdat<=i2c_data[10];
          69:reg_sdat<=i2c_data[9];
          73:reg_sdat<=i2c_data[8];
          77:reg_sdat<=1;                //应答信号       
          81:begin reg_sdat<=i2c_data[7];ack2<=i2c_sdat;end
          85:reg_sdat<=i2c_data[6];
          89:reg_sdat<=i2c_data[5];
          93:reg_sdat<=i2c_data[4];
          97:reg_sdat<=i2c_data[3];
          101:reg_sdat<=i2c_data[2];
          105:reg_sdat<=i2c_data[1];
          109:reg_sdat<=i2c_data[0];
          113:reg_sdat<=1;                //应答信号            
          117:begin sclk<=0;reg_sdat<=0;ack3<=i2c_sdat;end
          121:sclk<=1;
          125:begin reg_sdat<=1;tr_end<=1;end
          endcase
       
end
endmodule

