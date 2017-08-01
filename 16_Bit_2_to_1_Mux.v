module Bit_2_to_1_Mux (out, i0, i1, s0);
	output [15:0] out;
	input [15:0] i0, i1;
	input s0;

	reg [15:0] tempout;
	
	always @(s0,i0,i1)
	begin	
	
	if (s0==1'b0)
		tempout = i0; 
	else if (s0==1'b1)
		tempout = i1;
	end	
	
	assign out=tempout;
	
endmodule


module Test_16_Bit_2_to_1_Mux;

	reg [15:0] IN0, IN1;
	reg S0;

	wire [15:0] OUTPUT;
		
	Bit_2_to_1_Mux mymux(OUTPUT, IN0, IN1,S0);
	
	initial
	begin

		IN0 = 16'b1001110101111001; IN1 = 16'b1000001111110101;
		#1 $display("IN0= %b, IN1= %b.\n",IN0,IN1);

		S0 = 0;
		#1 $display("S0 = %b, OUTPUT = %b \n", S0, OUTPUT);
		
		S0 = 1;
		#1 $display("S0 = %b, OUTPUT = %b \n",S0, OUTPUT);
	end
	
endmodule
