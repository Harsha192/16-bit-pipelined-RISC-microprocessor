module alu(Input1,Input2,z,c_in,c_out,lt,eq,gt,overflow,Operation);
	input [15:0]Input1,Input2;
	input [2:0]Operation;
	input c_in;
	output reg c_out,overflow,lt,gt,eq;
	output reg[15:0] z;
	
	always @(Input1,Input2,Operation)
		begin
			assign c_out=1'b0;
			assign overflow=1'b0; 
			assign lt=16'b0;
			assign gt=16'b0;
			assign eq=16'b0;
			case(Operation)
				
				3'b000:
					begin
						assign z=Input1 & Input2;	
					end
				
				
				3'b001:
					begin
						assign  z=Input1 | Input2;	
					end
				
				
				3'b010:
					begin
						assign {c_out,z}=Input1+Input2+c_in;
						assign overflow=c_out;
					end
				
				3'b011:
					begin
						assign{c_out,z}=Input1-Input2;
						assign overflow=c_out;
					end
				
				
				3'b111:
					begin
						if(Input1<Input2)
							begin
								assign z=16'b1;
							end
						else
							begin
								assign z=16'b0;
							end
					end
			endcase
			
			if(Input1<Input2)
				begin
					assign lt=16'b1;
				end
			else if(Input1>Input2)
				begin
					assign gt=16'b1;
				end
			else
				begin
					assign eq=16'b1;
				end		
				
		end

endmodule





module Test_ALU;

	reg[15:0]  In1,In2;
	reg [2:0]Operation;
	reg c_in;
	
	wire c_out,overflow,lt,gt,eq;
	wire [15:0] z;

		
	alu myalu(In1,In2,z,c_in,c_out,lt,eq,gt,overflow,Operation);
	
	initial
		begin
		
			In1=16'd4; In2=16'd3;Operation=3'b000;c_in=1'b0;
			#10 $display("In1=%d ,In2=%d ,Operation=%d ,c_in=%d ,c_out=%b ,lt=%b ,eq=%b ,gt=%b ,overflow=%b ,outz=%d\n",In1,In2,Operation,c_in,c_out,lt,eq,gt,overflow,z);
			In1=16'd4; In2=16'd3;Operation=3'b001;c_in=1'b0;
			#15 $display("In1=%d ,In2=%d ,Operation=%d ,c_in=%d ,c_out=%b ,lt=%b ,eq=%b ,gt=%b ,overflow=%b ,outz=%d\n",In1,In2,Operation,c_in,c_out,lt,eq,gt,overflow,z);
			In1=16'd4; In2=16'd3;Operation=3'b010;c_in=1'b0;
			#20 $display("In1=%d ,In2=%d ,Operation=%d ,c_in=%d ,c_out=%b ,lt=%b ,eq=%b ,gt=%b ,overflow=%b ,outz=%d\n",In1,In2,Operation,c_in,c_out,lt,eq,gt,overflow,z);
			In1=16'd4; In2=16'd3;Operation=3'b011;c_in=1'b0;
			#30 $display("In1=%d ,In2=%d ,Operation=%d ,c_in=%d ,c_out=%b ,lt=%b ,eq=%b ,gt=%b ,overflow=%b ,outz=%d\n",In1,In2,Operation,c_in,c_out,lt,eq,gt,overflow,z);
			In1=16'd4; In2=16'd3;Operation=3'b111;c_in=1'b0;
			#35 $display("In1=%d ,In2=%d ,Operation=%d ,c_in=%d ,c_out=%b ,lt=%b ,eq=%b ,gt=%b ,overflow=%b ,outz=%d\n",In1,In2,Operation,c_in,c_out,lt,eq,gt,overflow,z);
			
			
		end
		
		
		
	
endmodule