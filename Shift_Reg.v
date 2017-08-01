module uni_shift_register(Out,Input,clock,enable,s0,s1,left_shift_input,right_shift_input);
	input  [15:0] Input;
	output reg [15:0] Out;
	input clock,enable,s0,s1;
	input left_shift_input,right_shift_input;
	
	reg [15:0] keep;
	
	always@(posedge clock)
		begin
			if(enable == 1'b1)
				begin
					if(s0==1'b0 && s1==1'b0)
						begin
							Out=Out;
						end
					else if(s0==1'b1 && s1==1'b0)
						begin
							keep[14:0]=Out[15:1];
							keep[15] = right_shift_input;
							
							Out[15:0]=keep[15:0];
						end
					else if(s0==1'b0 && s1==1'b1)
						begin
							keep[15:1]=Out[14:0];
							keep[0] = left_shift_input;
							
							Out[15:0]=keep[15:0];
			
						end
					else if(s0==1'b1 && s1==1'b1)
						begin
							Out[15:0]=Input[15:0];
							
						end
						
				end
			else
				begin
				end
		end
endmodule


module Test_Shift_Reg;
	wire [15:0] out;
	reg [15:0] In;
	reg clock,enable,s0,s1;
	reg left_shift_input,right_shift_input;
	
	initial
		clock = 1'b1;
		
	always
		#5 clock = ~clock;
		
	initial
		#200 $finish;
		
	uni_shift_register shift(out,In,clock,enable,s0,s1,left_shift_input,right_shift_input);
	
	initial
		begin
			
			
			#5 enable=1'b1 ; In=16'b1010101010101010; left_shift_input=1'b0; right_shift_input=1'b0; s0=1'b1; s1=1'b1;
			#15 $display("enable=%b ,Input=%b ,left_shift_input=%b ,right_shift_input=%b, s0=%b, s1=%b,out=%b \n",enable,In,left_shift_input,right_shift_input,s0,s1,out);
		
			
			#5 enable=1'b1 ; In=16'b1010101010101010; left_shift_input=1'b0; right_shift_input=1'b1; s0=1'b1; s1=1'b0;
			#15 $display("enable=%b ,Input=%b ,left_shift_input=%b ,right_shift_input=%b, s0=%b, s1=%b,out=%b \n",enable,In,left_shift_input,right_shift_input,s0,s1,out);
			
				
			#5 enable=1'b1 ; In=16'b1010101010101010; left_shift_input=1'b0; right_shift_input=1'b0; s0=1'b1; s1=1'b1;
			#15 $display("enable=%b ,Input=%b ,left_shift_input=%b ,right_shift_input=%b, s0=%b, s1=%b,out=%b \n",enable,In,left_shift_input,right_shift_input,s0,s1,out);
		
			
			#5 enable=1'b1 ; In=16'b1010101010101010; left_shift_input=1'b0; right_shift_input=1'b0; s0=1'b0; s1=1'b1;
			#15 $display("enable=%b ,Input=%b ,left_shift_input=%b ,right_shift_input=%b, s0=%b, s1=%b,out=%b \n",enable,In,left_shift_input,right_shift_input,s0,s1,out);
			
			#5 enable=1'b1 ; In=16'b1010101010101010; left_shift_input=1'b0; right_shift_input=1'b0; s0=1'b1; s1=1'b1;
			#15 $display("enable=%b ,Input=%b ,left_shift_input=%b ,right_shift_input=%b, s0=%b, s1=%b,out=%b \n",enable,In,left_shift_input,right_shift_input,s0,s1,out);
		
			#5 enable=1'b1 ; In=16'b1010101010101010;left_shift_input=1'b0; right_shift_input=1'b0; s0=1'b0; s1=1'b0;
			#15 $display("enable=%b ,Input=%b ,left_shift_input=%b ,right_shift_input=%b, s0=%b, s1=%b,out=%b \n",enable,In,left_shift_input,right_shift_input,s0,s1,out);	
			
		end
		
		
		
	
endmodule