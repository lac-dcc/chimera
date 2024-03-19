module full_adder (cin, a,b, sum, cout);
input cin,a,b;
output sum,cout;
wire temp,store,result;
xor (temp,a,b);
xor (sum,temp,cin);
and (result,a,b);
and (store,temp,cin);
or (cout,result, store);
endmodule