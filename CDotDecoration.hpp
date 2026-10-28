#pragma once
#include <hyprland/src/devices/Keyboard.hpp>
#include <hyprland/src/render/Texture.hpp>
#include <hyprland/src/render/decorations/IHyprWindowDecoration.hpp>
#include <hyprland/src/event/EventBus.hpp>
#include <hyprland/src/plugins/PluginAPI.hpp>

class CDotDecoration : public IHyprWindowDecoration {
public:
  CDotDecoration(PHLWINDOW);
  ~CDotDecoration() override;
  SDecorationPositioningInfo getPositioningInfo() override;
  void draw(Render::CRenderContext& ctx, PHLMONITOR pMonitor, float const& a,
          const Render::SWindowRenderPresentation& presentation) override;
  eDecorationType getDecorationType() override;
  eDecorationLayer getDecorationLayer() override;
  void updateWindow(PHLWINDOW pWindow) override;
  void damageEntire() override;
  uint64_t getDecorationFlags() override;
  std::string getDisplayName() override;
  virtual CBox getSquareBox();
  void onPositioningReply(const SDecorationPositioningReply &reply) override;
  PHLWINDOW getOwner();
  virtual void onKeypress(const IKeyboard::SKeyEvent& event);
  virtual std::string getHandForKeyEvent(IKeyboard::SKeyEvent event);

private:
  CHyprSignalListener m_pKeypressCallback;
  PHLWINDOWREF m_pWindow;
  SP<Render::ITexture> m_pTexture;
  struct {
    int32_t left = 0;
    int32_t right = 0;
  } m_hands;
};
