module Counter(count_out, value,operation,clock,enable);
	input clock,enable;
	output [3:0] count_out;
	input [1:0] operation;
	input [3:0] value;
	
	reg [3:0] count;
	
	always @(posedge clock)
		begin
			if(enable==1'b0)
			begin
				count[3] <= 1'b0;
				count[2] <= 1'b0;
				count[1] <= 1'b0;
				count[0] <= 1'b0;
			end
			else
				begin
					if(operation[1]==1'b0 && operation[0]==1'b0)
						begin
							count<=value;
						end
					else if(operation[1]==1'b0 && operation[0]==1'b1)
						begin
							count<=count_out;
						end
					else if(operation[1]==1'b1 && operation[0]==1'b0)
						begin
							count<=value+4'b0001;
						end
					else if(operation[1]==1'b1 && operation[0]==1'b1)
						begin
							count <= value- 4'b0001;
						end
				end
		end
	assign count_out=count;
endmodule

module Test_Counter;
	reg clock;
	reg enable;
	reg s0,s1;
	wire [1:0] out;
	wire [3:0] count;
	reg [3:0] value;
	
	
	initial 
		clock =  1'b0;
		
	always
		#5 clock = ~clock;
	
	initial
		#1000 $finish;
		
	mux4_to_1 m1(out,2'b00,2'b01,2'b10,2'b11,s1,s0);
	Counter c1(count,value,out,clock,enable);
		
	initial
		begin
			#5 enable=1'b0; s0=1'b0; s1=1'b1; value[3]=1'b1; value[2]=1'b0; value[1]=1'b0; value[0]=1'b1; 
			#15 $display("enable=%b, s0=%b s1=%b, Input : %b %b %b %b, Output : %b %b %b %b",enable,s0,s1,value[3],value[2],value[1],value[0],count[3],count[2],count[1],count[0]);
			
			#5 enable=1'b1; s0=1'b0; s1=1'b0; value[3]=1'b1; value[2]=1'b0; value[1]=1'b0; value[0]=1'b1; 
			#15 $display("enable=%b, s0=%b s1=%b, Input : %b %b %b %b, Output : %b %b %b %b",enable,s0,s1,value[3],value[2],value[1],value[0],count[3],count[2],count[1],count[0]);
			
			#5 enable=1'b1; s0=1'b1; s1=1'b0; value[3]=1'b1; value[2]=1'b0; value[1]=1'b0; value[0]=1'b1; 
			#15 $display("enable=%b, s0=%b s1=%b, Input : %b %b %b %b, Output : %b %b %b %b",enable,s0,s1,value[3],value[2],value[1],value[0],count[3],count[2],count[1],count[0]);
			
			#5 enable=1'b1; s0=1'b0; s1=1'b1; value[3]=1'b1; value[2]=1'b0; value[1]=1'b0; value[0]=1'b1; 
			#15 $display("enable=%b, s0=%b s1=%b, Input : %b %b %b %b, Output : %b %b %b %b",enable,s0,s1,value[3],value[2],value[1],value[0],count[3],count[2],count[1],count[0]);
			
			#5 enable=1'b1; s0=1'b1; s1=1'b1; value[3]=1'b1; value[2]=1'b0; value[1]=1'b0; value[0]=1'b1; 
			#15 $display("enable=%b, s0=%b s1=%b, Input : %b %b %b %b, Output : %b %b %b %b",enable,s0,s1,value[3],value[2],value[1],value[0],count[3],count[2],count[1],count[0]);
		end
endmodule



module mux4_to_1 (out, i0, i1, i2, i3, s1, s0);
	
	// Port declarations from the I/O diagram
	output [1:0] out;
	input [1:0] i0, i1, i2, i3;
	input s1, s0;

	reg [1:0] tempout;
	
	always @(s0,s1,i0,i1,i2,i3)
	begin	
	if (s1==1'b0 && s0==1'b0)
		tempout = i0; 
	else if (s1==1'b0 && s0==1'b1)
		tempout = i1;
	else if (s1==1'b1 && s0==1'b0)
		tempout = i2;
	else
		tempout = i3;

	end	
	
	assign out=tempout;
	
endmodule