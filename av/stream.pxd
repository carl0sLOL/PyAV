cimport libav as lib
from av.codec cimport Codec
from av.packet cimport Packet
from av.context cimport Context, ContextProxy
from av.frame cimport Frame


cdef class Stream(object):
    
    cdef readonly bytes type
    
    cdef ContextProxy ctx
    cdef weak_ctx
    
    cdef lib.AVStream *ptr
    
    cdef readonly Codec codec
    cdef readonly dict metadata

    
    cpdef decode(self, Packet packet)
    cdef _setup_frame(self, Frame frame)
    cdef Frame _decode_one(self, lib.AVPacket *packet, int *data_consumed)


cdef Stream stream_factory(Context ctx, int index)
