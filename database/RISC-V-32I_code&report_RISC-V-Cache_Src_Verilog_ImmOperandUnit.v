//ImmOperandUnit接收32bit指令除了操作码以外所有的比特，同时接收来自控制单元的Type信号，输出不同类型的立即数
//Type分为五类：ISBUJ
module ImmOperandUnit(
input wire [31:7] In,
input wire [2:0] Type,
output reg [31:0] Out
    );
    //
`include "Parameters.v"
    //
    always@(*)
    begin
        case(Type)
            ITYPE:     //I
                Out<={ {21{In[31]}}, In[30:20] };
            STYPE:      //S
                Out<={ {21{In[31]}}, In[30:25], In[11:7] };
            BTYPE:      //B
                Out<={ {20{In[31]}}, In[7], In[30:25], In[11:8], 1'b0 };
            UTYPE:      //U
                Out<={ In[31:12], 12'b0 };
            JTYPE:      //J
                Out<={ {12{In[31]}}, In[19:12], In[20], In[30:21], 1'b0 };
            default:   //其他 返回32'b0
                Out<=32'b0;
        endcase
    end
    
endmodule