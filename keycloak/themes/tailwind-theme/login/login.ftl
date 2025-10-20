<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <div class="mb-8">
            <!-- Brand Logo -->
            <div class="flex items-center mb-8">
                <#if realm.logo??>
                    <img src="${realm.logo}" alt="${realm.displayName!} Logo" class="h-8 w-8"/>
                <#else>
                    <img src="${url.resourcesPath}/${properties.logoPath!'img/logo.png'}" alt="${realm.displayName!} Logo" class="h-8 w-8"/>
                </#if>
                <span class="ml-3 text-lg font-semibold text-gray-900">${realm.displayName!}</span>
            </div>
            
            <!-- Welcome Text -->
            <div class="text-left">
                <h1 class="text-2xl font-semibold text-gray-900 mb-2">${msg("loginWelcomeBack")}</h1>
                <p class="text-gray-600">${msg("loginWelcomeMessage")}</p>
            </div>
        </div>
    <#elseif section = "form">
    <div id="kc-form">
      <div id="kc-form-wrapper">
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="space-y-5">
                    <div class="form-group">
                        <label for="username" class="block text-sm font-medium text-gray-900 mb-2">
                            ${msg("loginEmailLabel")}
                        </label>
                        <input tabindex="1" id="username" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off"
                               placeholder="${msg("loginEmailPlaceholder")}"
                               class="w-full px-3 py-3 border border-gray-300 rounded-lg shadow-sm placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-colors"
                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                        />
                        <#if messagesPerField.existsError('username','password')>
                            <span id="input-error" class="text-red-600 text-sm mt-1 block" aria-live="polite">
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="form-group">
                        <label for="password" class="block text-sm font-medium text-gray-900 mb-2">${msg("loginPasswordLabel")}</label>
                        <div class="relative">
                            <input tabindex="2" id="password" name="password" type="password" autocomplete="off"
                                   placeholder="${msg("loginPasswordPlaceholder")}"
                                   class="w-full px-3 py-3 pr-10 border border-gray-300 rounded-lg shadow-sm placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-colors"
                                   aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                            />
                            <button type="button" class="absolute inset-y-0 right-0 pr-3 flex items-center" onclick="togglePassword()">
                                <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                                </svg>
                            </button>
                        </div>
                    </div>

                    <div class="flex items-center justify-between">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="flex items-center">
                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" <#if login.rememberMe??>checked</#if>
                                       class="h-4 w-4 bg-primary-600 focus:ring-primary-500 border-gray-300 rounded">
                                <label for="rememberMe" class="ml-2 block text-sm text-gray-900">
                                    ${msg("loginRememberMe")}
                                </label>
                            </div>
                        </#if>
                        <#if realm.resetPasswordAllowed>
                            <div class="text-sm">
                                <a href="${url.loginResetCredentialsUrl}" class="font-medium text-primary-600 hover:text-primary-500">
                                    ${msg("loginForgotPassword")}
                                </a>
                            </div>
                        </#if>
                    </div>

                    <div class="form-group">
                        <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                        <button tabindex="4" class="w-full flex justify-center py-3 px-4 border border-transparent rounded-lg shadow-sm text-sm font-medium text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition duration-150 ease-in-out" name="login" id="kc-login" type="submit">
                            ${msg("loginButton")}
                        </button>
                    </div>
                </div>
            </form>
        </#if>
        </div>

        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="mt-6">
                <div class="relative">
                    <div class="absolute inset-0 flex items-center">
                        <div class="w-full border-t border-gray-300" />
                    </div>
                    <div class="relative flex justify-center text-sm">
                        <span class="px-2 bg-white text-gray-500">${msg("loginOr")}</span>
                    </div>
                </div>

                <div class="mt-6">
                    <#list social.providers as p>
                        <#if p.alias == 'google'>
                            <a id="social-${p.alias}" class="w-full inline-flex justify-center items-center py-3 px-4 border border-gray-300 rounded-lg shadow-sm bg-white text-sm font-medium text-gray-700 hover:bg-gray-50 transition duration-150 ease-in-out mb-3"
                               href="${p.loginUrl}">
                                <svg class="w-5 h-5 mr-3" viewBox="0 0 24 24">
                                    <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                                    <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                                    <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                                    <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
                                </svg>
                                ${msg("loginContinueWith", "Google")}
                            </a>
                        <#else>
                            <a id="social-${p.alias}" class="w-full inline-flex justify-center py-3 px-4 border border-gray-300 rounded-lg shadow-sm bg-white text-sm font-medium text-gray-700 hover:bg-gray-50 transition duration-150 ease-in-out mb-3"
                               href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!} mr-3" aria-hidden="true"></i>
                                </#if>
                                ${msg("loginContinueWith", p.displayName!)}
                            </a>
                        </#if>
                    </#list>
                </div>
            </div>
        </#if>

    </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration" class="mt-8 text-center">
                <div class="text-sm text-gray-600">
                    ${msg("loginNoAccount")}
                    <a href="${url.registrationUrl}" class="font-medium text-primary-600 hover:text-primary-500 ml-1">
                        ${msg("loginSignUp")}
                    </a>
                </div>
                <div class="text-xs text-gray-500 mt-4">
                    ${msg("loginCopyright")}
                </div>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
