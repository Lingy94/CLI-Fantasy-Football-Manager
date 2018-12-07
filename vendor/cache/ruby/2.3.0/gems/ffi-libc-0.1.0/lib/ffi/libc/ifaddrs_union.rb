require 'ffi'

module FFI
  module LibC
    #
    # @since 0.1.0
    #
    class IfaddrsUnion < FFI::Union

      layout :ifu_broadaddr, :pointer,
             :ifu_dstaddr,   :pointer

    end
  end
end
