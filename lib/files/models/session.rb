if session_record.expired?
  session_record.destroy
  render json: { error: "session_expired" }, status: 401
else

  def sign_out
    Current.session.destroy
    head 204
  end

  before_create :set_timeout

  TIMEOUT = 1.minute

  def timeout
    Time.at(read_attribute(:timeout))
  end

  def expired?
    timeout < Time.current
  end

  private

  def set_timeout
    self.timeout = TIMEOUT.from_now
  end
