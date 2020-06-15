function X = spm_inv(A,TOL)
% inverse for ill-conditioned matrices
% FORMAT X = spm_inv(A)
%
% X   - matrix
%
% This routine simply adds a small identity matrix to A and calls inv.m
%__________________________________________________________________________
% Copyright (C) 2008 Wellcome Trust Centre for Neuroimaging
 
% Karl Friston
% $Id: spm_inv.m 3877 2010-05-07 19:49:35Z karl $
 
% check A 
%--------------------------------------------------------------------------
[m,n] = size(A);
if isempty(A), X = sparse(n,m); return, end
 
% inverse
%--------------------------------------------------------------------------
if nargin<2
    TOL = eps(norm(A,'inf'))*max(m,n);
end
X   = inv(A + speye(m,n)*TOL);
