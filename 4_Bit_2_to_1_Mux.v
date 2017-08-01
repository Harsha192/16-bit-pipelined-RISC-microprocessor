module Bit_2_to_1_Mux (out, i0, i1, s0);
	output [3:0] out;
	input [3:0] i0, i1;
	input s0;
	reg [3:0] tempout;
	
	always @(s0,i0,i1)
	begin	
	
	if (s0==1'b0)
		tempout = i0; 
	else if (s0==1'b1)
		tempout = i1;
	end	
	
	assign out=tempout;
	
endmodule

module Test_4_Bit_2_to_1_Mux;

	reg [3:0] IN0, IN1;
	reg S0;
	
	wire [3:0] OUTPUT;
		
	Bit_2_to_1_Mux mymux(OUTPUT, IN0, IN1,S0);
	
	initial
	begin
	
		IN0 = 4'b1001; IN1 = 4'b1000;
		#1 $display("IN0= %b, IN1= %b.\n",IN0,IN1);
		
		S0 = 0;
		#1 $display("S0 = %b, OUTPUT = %b \n", S0, OUTPUT);
	
		S0 = 1;
		#1 $display("S0 = %b, OUTPUT = %b \n",S0, OUTPUT);
	end
	
endmodule
