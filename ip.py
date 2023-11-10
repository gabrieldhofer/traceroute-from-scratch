class IP:
  def __init__(self): 
    self.data = [None] * 32
    self.options = [None] * 32
    self.destination_ip_addr = [None] * 32
    self.source_ip_addr = [None] * 32
    self.ttl = [None] * 8
    self.protocol = [None] * 8
    self.checksum = [None] * 16
    self.identification = [None] * 16
    self.flags = [None] * 3
    self.fragment_offset = [None] * 13
    self.version = [None] * 4
    self.header_length = [None] * 4
    self.type_of_service = [None] * 8
    self.total_length = [None] * 16
