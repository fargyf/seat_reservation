module SeatsHelper
  def seat_warning(seat)
    case seat.type.id
    when Type.mudi.id
      case seat.state.id
      when State.bukeshou.id
        "bukeshou"
      when State.keshou.id
        "keshou"
      when State.yuding.id
        "yuding"
      when State.qiatan.id
        "qiatan"
      when State.shigong.id
        "shigong"
      when State.yanshou.id
        "yanshou"
      when State.tongzhikehu.id
        "tongzhikehu"
      when State.jieshu.id
        "jieshu"
      end
    when Type.lvhua.id
      "lvhua"
    when Type.gonglu.id
      "gonglu"
    end
  end
end
