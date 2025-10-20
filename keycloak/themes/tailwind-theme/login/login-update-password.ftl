<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
        <div class="text-center">
            <h1 class="text-3xl font-bold text-gray-900 mb-2">${msg("updatePasswordWelcome")}</h1>
            <p class="text-gray-600">${msg("updatePasswordMessage")}</p>
        </div>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-form-update-password" action="${url.loginAction}" method="post">
                    <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
                    <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

                    <div class="space-y-6">
                        <div class="form-group">
                            <label for="password-new" class="block text-sm font-medium text-gray-700">${msg("passwordNew")}</label>
                            <input type="password" id="password-new" name="password-new" autofocus autocomplete="new-password"
                                   class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                                   aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                            />
                            <#if messagesPerField.existsError('password')>
                                <span class="text-red-600 text-sm mt-1 block" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                </span>
                            </#if>
                        </div>

                        <div class="form-group">
                            <label for="password-confirm" class="block text-sm font-medium text-gray-700">${msg("passwordConfirm")}</label>
                            <input type="password" id="password-confirm" name="password-confirm" autocomplete="new-password"
                                   class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                                   aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                            />
                            <#if messagesPerField.existsError('password-confirm')>
                                <span class="text-red-600 text-sm mt-1 block" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                </span>
                            </#if>
                        </div>

                        <div class="form-group">
                            <#if isAppInitiatedAction??>
                                <input class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition duration-150 ease-in-out" 
                                       type="submit" value="${msg("doSubmit")}"/>
                                <button class="mt-3 w-full inline-flex justify-center py-2 px-4 border border-gray-300 rounded-md shadow-sm bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 transition duration-150 ease-in-out" 
                                        type="submit" name="cancel-aia" value="true">${msg("doCancel")}</button>
                            <#else>
                                <input class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition duration-150 ease-in-out" 
                                       type="submit" value="${msg("doSubmit")}"/>
                            </#if>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
