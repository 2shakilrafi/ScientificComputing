function [val, row_ind, col_ptr] = CCS(A)

% this is a function that converts a matrix into CCS format
% outputs are val, values, row_ind, row indices, and pointers to the columns col_ptr    
[~,n] = size(A);                        % size is initialized using m,n

[row_ind,col, val] = find(A);           % the row indices and val is found from find(A)

col_ptr = zeros(n,1);                   % column pointer is initialized to zero

for i = 1:n                             % we loop through to find the pointers
    col_ptr(i) = find(col==i,1);        % the column pointer is the first of the elements in a column that is non-zero
end
col_ptr = [col_ptr; nnz(A)+1];          % we add an eol to the col_ptr to help future calculations
end