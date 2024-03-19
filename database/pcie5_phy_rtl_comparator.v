module comparator(input[4:0]counterValue,input[4:0]checkValue ,output comparisonValue);
assign comparisonValue = (counterValue >= checkValue)? 1'b1 : 1'b0;
endmodule