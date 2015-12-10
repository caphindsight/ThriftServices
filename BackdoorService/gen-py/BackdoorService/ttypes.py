#
# Autogenerated by Thrift Compiler (0.9.3)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#
#  options string: py
#

from thrift.Thrift import TType, TMessageType, TException, TApplicationException

from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol, TProtocol
try:
  from thrift.protocol import fastbinary
except:
  fastbinary = None



class ExecResponse:
  """
  Attributes:
   - ExitCode
   - StdOut
   - StdErr
  """

  thrift_spec = (
    None, # 0
    (1, TType.I32, 'ExitCode', None, None, ), # 1
    (2, TType.STRING, 'StdOut', None, None, ), # 2
    (3, TType.STRING, 'StdErr', None, None, ), # 3
  )

  def __init__(self, ExitCode=None, StdOut=None, StdErr=None,):
    self.ExitCode = ExitCode
    self.StdOut = StdOut
    self.StdErr = StdErr

  def read(self, iprot):
    if iprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and isinstance(iprot.trans, TTransport.CReadableTransport) and self.thrift_spec is not None and fastbinary is not None:
      fastbinary.decode_binary(self, iprot.trans, (self.__class__, self.thrift_spec))
      return
    iprot.readStructBegin()
    while True:
      (fname, ftype, fid) = iprot.readFieldBegin()
      if ftype == TType.STOP:
        break
      if fid == 1:
        if ftype == TType.I32:
          self.ExitCode = iprot.readI32()
        else:
          iprot.skip(ftype)
      elif fid == 2:
        if ftype == TType.STRING:
          self.StdOut = iprot.readString()
        else:
          iprot.skip(ftype)
      elif fid == 3:
        if ftype == TType.STRING:
          self.StdErr = iprot.readString()
        else:
          iprot.skip(ftype)
      else:
        iprot.skip(ftype)
      iprot.readFieldEnd()
    iprot.readStructEnd()

  def write(self, oprot):
    if oprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and self.thrift_spec is not None and fastbinary is not None:
      oprot.trans.write(fastbinary.encode_binary(self, (self.__class__, self.thrift_spec)))
      return
    oprot.writeStructBegin('ExecResponse')
    if self.ExitCode is not None:
      oprot.writeFieldBegin('ExitCode', TType.I32, 1)
      oprot.writeI32(self.ExitCode)
      oprot.writeFieldEnd()
    if self.StdOut is not None:
      oprot.writeFieldBegin('StdOut', TType.STRING, 2)
      oprot.writeString(self.StdOut)
      oprot.writeFieldEnd()
    if self.StdErr is not None:
      oprot.writeFieldBegin('StdErr', TType.STRING, 3)
      oprot.writeString(self.StdErr)
      oprot.writeFieldEnd()
    oprot.writeFieldStop()
    oprot.writeStructEnd()

  def validate(self):
    if self.ExitCode is None:
      raise TProtocol.TProtocolException(message='Required field ExitCode is unset!')
    return


  def __hash__(self):
    value = 17
    value = (value * 31) ^ hash(self.ExitCode)
    value = (value * 31) ^ hash(self.StdOut)
    value = (value * 31) ^ hash(self.StdErr)
    return value

  def __repr__(self):
    L = ['%s=%r' % (key, value)
      for key, value in self.__dict__.iteritems()]
    return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

  def __eq__(self, other):
    return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

  def __ne__(self, other):
    return not (self == other)